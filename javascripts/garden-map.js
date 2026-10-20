/**
 * Ohme Gardens - Official Interactive Illustrated Trail Map
 * Grounded in the authentic Ohme Gardens trail map:
 * 1 Mile of Natural Stone Paths | 53 Stone Benches | 7 Pools | 4 Waterfalls
 * WCAG 2.1 AA / Level AAA compliant, keyboard navigable, fully responsive
 */

(function () {
    "use strict";

    const STOPS_DATA = {
        1: {
            id: 1,
            number: "1",
            title: "Garden Entrance & Ox Yoke Lodge",
            kicker: "WELCOME &bull; TRAILHEAD START",
            quote: "Where your alpine journey begins",
            image: "/images/garden/full/Gallery20.jpg",
            description: "The historic stone entrance, admissions pavilion, and Ox Yoke Lodge welcome you to Ohme Gardens. Pick up a printed trail guide, browse the Gift Shop, fill your water bottle at Stump Water, and access restrooms before starting your walk.",
            walkTime: "0 min walk",
            walkDetail: "trailhead start",
            difficulty: "Easy path",
            difficultyDetail: "level flagstone entry",
            category: "easy",
            tags: ["easy", "lodges"],
            features: ["Admissions & Gift Shop", "Restrooms", "Stump Water", "Entrance Lawn"]
        },
        2: {
            id: 2,
            number: "2",
            title: "Sylvan Pool & Hobbit Bench",
            kicker: "CENTRAL GARDEN &bull; POOL 1 OF 7",
            quote: "Mirror waters amidst alpine rock",
            image: "/images/garden/full/Gallery14.jpg",
            description: "Tranquil mountain waters nestled beneath mature Douglas firs and native stone arches. Take a quiet rest on the historic Hobbit Bench or pause beside the stone outdoor fireplace built by Herman Ohme in the 1930s.",
            walkTime: "3 min walk",
            walkDetail: "from the entrance",
            difficulty: "Easy path",
            difficultyDetail: "gentle stone paths",
            category: "easy",
            tags: ["easy", "pools"],
            features: ["Sylvan Pool", "Hobbit Bench", "Stone Fireplace", "Conifer Canopy"]
        },
        3: {
            id: 3,
            number: "3",
            title: "Lower Lawn & Totem Pole Lodge",
            kicker: "LOWER GARDEN &bull; WEDDING VENUE",
            quote: "A lush emerald carpet on a dry promontory",
            image: "/images/garden/full/Gallery11.jpg",
            description: "The crown jewel of the lower garden: a lush, open emerald lawn surrounded by stone walls, rustic cedar woodwork, and the historic Totem Pole Lodge. A favorite gathering space for summer evening concerts, family picnics, and romantic weddings.",
            walkTime: "5 min walk",
            walkDetail: "from the entrance",
            difficulty: "Easy path",
            difficultyDetail: "flat lawn & flagstone",
            category: "easy",
            tags: ["easy", "lodges"],
            features: ["Lower Lawn", "Totem Pole Lodge", "Sunken Lawn", "Stone Steps"]
        },
        4: {
            id: 4,
            number: "4",
            title: "Moment-In-Time Waterfall",
            kicker: "LOWER GARDEN &bull; WATERFALL 1 OF 4",
            quote: "The calming melody of falling water",
            image: "/images/garden/full/Gallery19.jpg",
            description: "A secluded cascade flowing over moss-draped river stones into a cool reflecting pool beside the Sunken Lawn. Listen to the gentle trickle of mountain water in this quiet, sheltered oasis.",
            walkTime: "6 min walk",
            walkDetail: "from the entrance",
            difficulty: "Easy path",
            difficultyDetail: "gentle flagstone walk",
            category: "easy",
            tags: ["easy", "pools", "waterfalls"],
            features: ["Cascading Falls", "Sunken Lawn", "Shaded Grotto", "Fern Beds"]
        },
        5: {
            id: 5,
            number: "5",
            title: "Vista House",
            kicker: "SOUTH RIDGE &bull; PREMIER LOOKOUT",
            quote: "Vast horizons over the Columbia River",
            image: "/images/garden/full/Gallery2.jpg",
            description: "Perched dramatically upon the southwestern cliff edge, the stone Vista House offers 180-degree panoramic views of the Columbia River, Wenatchee Valley orchards, and the rugged Cascade Range peaks. Hand-built from native rock hauled up the mountain.",
            walkTime: "8 min walk",
            walkDetail: "from the entrance",
            difficulty: "Moderate path",
            difficultyDetail: "incline & stone stairs",
            category: "viewpoints",
            tags: ["viewpoints", "lodges"],
            features: ["Historic Stone Shelter", "Columbia River Overlook", "Valley Panoramas", "Shaded Benches"]
        },
        6: {
            id: 6,
            number: "6",
            title: "Decision Point Falls & Top Pool",
            kicker: "SOUTH GARDEN &bull; WATERFALL 2 OF 4",
            quote: "Where the high and low stone trails divide",
            image: "/images/garden/full/Gallery15.jpg",
            description: "A picturesque alpine cascade that marks the junction between the high ridge trail and the lower garden paths. Features the crystal-clear Top Pool, stone footbridges, and the historic rustic Stone Table nearby.",
            walkTime: "7 min walk",
            walkDetail: "from the entrance",
            difficulty: "Moderate path",
            difficultyDetail: "split-level stone stairs",
            category: "pools",
            tags: ["pools", "waterfalls"],
            features: ["Decision Point Falls", "Top Pool", "Stone Table", "Trail Crossroads"]
        },
        7: {
            id: 7,
            number: "7",
            title: "Canadian Point & Wishing Well",
            kicker: "SOUTHERN PROMONTORY &bull; SCENIC CLIFF",
            quote: "Standing on the edge of the Wenatchee sky",
            image: "/images/garden/full/Gallery4.jpg",
            description: "The southernmost point in the gardens, offering sheer cliffside views overlooking the Columbia River bend. Stop by the historic stone Wishing Well and take in the cool mountain breeze from handcrafted stone perches.",
            walkTime: "11 min walk",
            walkDetail: "from the entrance",
            difficulty: "Steep path",
            difficultyDetail: "stone steps & narrow trail",
            category: "viewpoints",
            tags: ["viewpoints"],
            features: ["Canadian Point View", "Stone Wishing Well", "River Gorge Vistas", "Steep Staircase"]
        },
        8: {
            id: 8,
            number: "8",
            title: "U-Bench & Campfire Pit",
            kicker: "NORTH RIDGE &bull; RESTING HAVEN",
            quote: "A quiet alcove beneath aromatic ponderosas",
            image: "/images/garden/full/Gallery1.jpg",
            description: "A grand semicircular bench carved into the natural mountain rock, surrounded by towering pines and native alpine shrubs. Just down the path lies the historic stone Campfire Pit where the Ohme family spent summer evenings.",
            walkTime: "10 min walk",
            walkDetail: "from the entrance",
            difficulty: "Moderate path",
            difficultyDetail: "continuous gentle climb",
            category: "viewpoints",
            tags: ["viewpoints"],
            features: ["Iconic U-Bench", "Campfire Pit", "Pine Scented Air", "Valley View"]
        },
        9: {
            id: 9,
            number: "9",
            title: "Hidden Pool & Little Free Library",
            kicker: "NORTHWEST APEX &bull; POOL 4 OF 7",
            quote: "The garden's most secluded secret sanctuary",
            image: "/images/garden/full/Gallery21.jpg",
            description: "Tucked into the far northwestern heights of the garden, Hidden Pool is a secluded water retreat nestled among high granite ledges. Features 'My Little Free Library' where visitors can borrow a book and read on a shaded stone bench.",
            walkTime: "14 min walk",
            walkDetail: "from the entrance",
            difficulty: "Moderate path",
            difficultyDetail: "winding ridge trail",
            category: "pools",
            tags: ["pools"],
            features: ["Hidden Pool", "My Little Free Library", "Secluded Stone Benches", "Cool Microclimate"]
        },
        10: {
            id: 10,
            number: "10",
            title: "Twin Pools",
            kicker: "NORTHEAST SLOPE &bull; POOLS 5 & 6 OF 7",
            quote: "Cascading waters mirroring the mountain sky",
            image: "/images/garden/full/Gallery24.jpg",
            description: "Two crystalline alpine pools connected by a gentle stone runnel on the quiet northeastern hillside. Surrounded by mountain hemlock, junipers, and dry-stack stone walls offering sweeping views eastward toward the river hills.",
            walkTime: "13 min walk",
            walkDetail: "from the entrance",
            difficulty: "Steep path",
            difficultyDetail: "rock staircase descent",
            category: "pools",
            tags: ["pools"],
            features: ["Twin Cascading Pools", "Rock Garden Terraces", "East Hillside Views", "Quiet Sanctuary"]
        },
        11: {
            id: 11,
            number: "11",
            title: "Enchantment Falls & Cactus Point",
            kicker: "EAST RIDGE &bull; WATERFALL 3 OF 4",
            quote: "Where alpine waterfalls meet high-desert rock",
            image: "/images/garden/full/Gallery16.jpg",
            description: "A dramatic contrast where rushing mountain waters spill past cool stone ledges at Enchantment Falls, just steps away from the sun-drenched Cactus Point promontory featuring hardy native cacti and succulents adapted to the Columbia River gorge.",
            walkTime: "9 min walk",
            walkDetail: "from the entrance",
            difficulty: "Moderate path",
            difficultyDetail: "stone steps & ridge path",
            category: "waterfalls",
            tags: ["waterfalls", "viewpoints", "pools"],
            features: ["Enchantment Falls", "Cactus Point Promontory", "Native Succulent Garden", "East Vista"]
        }
    };

    let activeStopId = 1;
    let currentFilter = "all";

    function initGardenMap() {
        const mapContainer = document.getElementById("illustrated-garden-map");
        if (!mapContainer) return;

        // Bind Stop Pins
        const pins = mapContainer.querySelectorAll(".garden-map-pin");
        pins.forEach(pin => {
            pin.addEventListener("click", function (e) {
                e.preventDefault();
                const stopId = parseInt(this.getAttribute("data-stop-id"), 10);
                if (stopId && STOPS_DATA[stopId]) {
                    selectStop(stopId);
                }
            });

            pin.addEventListener("keydown", function (e) {
                if (e.key === "Enter" || e.key === " ") {
                    e.preventDefault();
                    const stopId = parseInt(this.getAttribute("data-stop-id"), 10);
                    if (stopId && STOPS_DATA[stopId]) {
                        selectStop(stopId);
                    }
                }
            });
        });

        // Bind Filter Buttons
        const filterBtns = document.querySelectorAll(".garden-map-filter-btn");
        filterBtns.forEach(btn => {
            btn.addEventListener("click", function () {
                const filter = this.getAttribute("data-filter") || "all";
                setFilter(filter);
            });
        });

        // Initialize with Stop 1
        selectStop(1);
    }

    function selectStop(stopId) {
        if (!STOPS_DATA[stopId]) return;
        activeStopId = stopId;
        const stop = STOPS_DATA[stopId];

        // 1. Update map pins active state
        const pins = document.querySelectorAll(".garden-map-pin");
        pins.forEach(pin => {
            const id = parseInt(pin.getAttribute("data-stop-id"), 10);
            if (id === stopId) {
                pin.classList.add("active");
                pin.setAttribute("aria-selected", "true");
                pin.setAttribute("tabindex", "0");
            } else {
                pin.classList.remove("active");
                pin.setAttribute("aria-selected", "false");
                pin.setAttribute("tabindex", "-1");
            }
        });

        // 2. Update Detail Card with smooth transition
        const detailCard = document.getElementById("garden-stop-detail-card");
        if (!detailCard) return;

        detailCard.classList.add("updating");

        setTimeout(() => {
            const kickerEl = document.getElementById("stop-detail-kicker");
            const titleEl = document.getElementById("stop-detail-title");
            const descEl = document.getElementById("stop-detail-desc");
            const quoteEl = document.getElementById("stop-detail-quote");
            const imgEl = document.getElementById("stop-detail-image");
            const walkTimeEl = document.getElementById("stop-detail-walk-time");
            const walkDetailEl = document.getElementById("stop-detail-walk-detail");
            const diffEl = document.getElementById("stop-detail-diff");
            const diffDetailEl = document.getElementById("stop-detail-diff-detail");
            const btnEl = document.getElementById("stop-detail-btn");
            const featuresListEl = document.getElementById("stop-detail-features");

            if (kickerEl) kickerEl.innerHTML = stop.kicker;
            if (titleEl) titleEl.textContent = stop.title;
            if (descEl) descEl.textContent = stop.description;
            if (quoteEl) quoteEl.textContent = stop.quote;
            if (imgEl) {
                imgEl.src = stop.image;
                imgEl.alt = stop.title + " at Ohme Gardens";
            }
            if (walkTimeEl) walkTimeEl.textContent = stop.walkTime;
            if (walkDetailEl) walkDetailEl.textContent = stop.walkDetail;
            if (diffEl) diffEl.textContent = stop.difficulty;
            if (diffDetailEl) diffDetailEl.textContent = stop.difficultyDetail;
            if (btnEl) {
                btnEl.setAttribute("data-stop-id", stop.id);
            }

            if (featuresListEl && stop.features) {
                featuresListEl.innerHTML = stop.features
                    .map(f => `<span class="badge rounded-pill bg-light text-dark border me-1 mb-1 font-raleway py-1 px-2">${f}</span>`)
                    .join("");
            }

            detailCard.classList.remove("updating");
        }, 150);
    }

    function setFilter(filterType) {
        currentFilter = filterType;

        const filterBtns = document.querySelectorAll(".garden-map-filter-btn");
        filterBtns.forEach(btn => {
            const f = btn.getAttribute("data-filter") || "all";
            if (f === filterType) {
                btn.classList.add("active");
                btn.setAttribute("aria-pressed", "true");
            } else {
                btn.classList.remove("active");
                btn.setAttribute("aria-pressed", "false");
            }
        });

        const pins = document.querySelectorAll(".garden-map-pin");
        let firstMatchingStopId = null;

        pins.forEach(pin => {
            const id = parseInt(pin.getAttribute("data-stop-id"), 10);
            const stop = STOPS_DATA[id];
            if (!stop) return;

            let matches = false;
            if (filterType === "all") {
                matches = true;
            } else if (filterType === "easy") {
                matches = stop.tags.includes("easy");
            } else if (filterType === "pools") {
                matches = stop.tags.includes("pools") || stop.tags.includes("waterfalls");
            } else if (filterType === "viewpoints") {
                matches = stop.tags.includes("viewpoints") || stop.tags.includes("lodges");
            }

            if (matches) {
                pin.classList.remove("dimmed");
                if (firstMatchingStopId === null) firstMatchingStopId = id;
            } else {
                pin.classList.add("dimmed");
            }
        });

        // If currently selected stop doesn't match the active filter, switch to first match
        if (firstMatchingStopId && STOPS_DATA[activeStopId]) {
            const curStop = STOPS_DATA[activeStopId];
            let curMatches = (filterType === "all") ||
                (filterType === "easy" && curStop.tags.includes("easy")) ||
                (filterType === "pools" && (curStop.tags.includes("pools") || curStop.tags.includes("waterfalls"))) ||
                (filterType === "viewpoints" && (curStop.tags.includes("viewpoints") || curStop.tags.includes("lodges")));

            if (!curMatches) {
                selectStop(firstMatchingStopId);
            }
        }
    }

    document.addEventListener("DOMContentLoaded", () => {
        initGardenMap();

        const exploreBtn = document.getElementById("stop-detail-btn");
        if (exploreBtn) {
            exploreBtn.addEventListener("click", function (e) {
                e.preventDefault();
                const stopId = parseInt(this.getAttribute("data-stop-id"), 10) || activeStopId;
                const stop = STOPS_DATA[stopId];
                if (stop) {
                    const modalTitle = document.getElementById("stopModalLabel");
                    const modalImg = document.getElementById("stopModalImage");
                    const modalDesc = document.getElementById("stopModalDesc");

                    if (modalTitle) modalTitle.textContent = stop.title;
                    if (modalImg) {
                        modalImg.src = stop.image;
                        modalImg.alt = stop.title;
                    }
                    if (modalDesc) modalDesc.textContent = stop.description;

                    const stopModalEl = document.getElementById("stopDetailModal");
                    if (stopModalEl && window.bootstrap && window.bootstrap.Modal) {
                        const modal = new window.bootstrap.Modal(stopModalEl);
                        modal.show();
                    }
                }
            });
        }
    });

    if (document.readyState === "interactive" || document.readyState === "complete") {
        initGardenMap();
    }
})();
