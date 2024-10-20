Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FABCD3C927
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Oct 2024 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqQ0GfLM1mORnPdD5nqtOrxo0pkgxmiQdwv+K372tOc=; b=ib3Emymn2ofVAo
	2zYBmcJDOqHuOTmZoM6gz5VWZujlTk9TmZE/xho6PBsSjH9VLIaPc3qjBCH9pIByRkKAmO1yxIDaT
	02imgsnStnAZ47uXLXRnTpKJ5sUdjsc+a79uuvw8NQdVM1VuNOSoQFXy+6lRHEBtLo6uLejlgLR3l
	gUiCHcfhSEPEA191dvu+K+1UwEvv2gQ/KwtgP8pS9Al+/W6bpSx9d3d7zL021StfrVisx4sIv3Uo1
	L3BeZ7vh5WrUmzPOgEU/16sEiRUnNYgRnm8czcYawpQDpl17XibPw93slFX4r8+1Sdrch6WT5fBKi
	3Qttr4X3x03dQ48lYoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2U59-00000004nsi-0140;
	Sun, 20 Oct 2024 11:26:47 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2U56-00000004nrK-0jt4
	for linux-i3c@lists.infradead.org;
	Sun, 20 Oct 2024 11:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729423604; x=1760959604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O4i1qBKKaJ66V6YTLTbvtIH7J/dRl9IZKUePZiOh//Y=;
  b=Bmg9dXExo6LGiT/MpMhLaVZZdUahfRiXixI1Rl/bmfxnqRx0PWjUgQHy
   aXCczrNUWPmaJmIfyEgZfNSKfAeSAPj4sGyzwHw4Fcfu/XT4K6nny6Nb7
   n8NnJr7gV2n8LPR2teNWFROstNR3QaKI7M/PMYrdvUjUYw7hVVH4p8dZi
   g7GBBtGv8HuGz0AoUhkjv7QZTDeQLN5mfCnDCHp+k4uzC9Npu+0JH3Rl8
   1Hn/oicUC6aTZrWDE9EW8+K1t+AdaD4atSSAVqAFThEOl9iXS+kGaACZO
   piTlWQCrp6Ff3NrGxsE1e0+yV6zg3pFwkua8bLwg0vRWhpWjc+wv9WAnS
   g==;
X-CSE-ConnectionGUID: Ghc0xl4JSquEtsADHPejzg==
X-CSE-MsgGUID: FNJCeGnWSfq2B/nBkSVY1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40268910"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="40268910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 04:26:41 -0700
X-CSE-ConnectionGUID: znHcLmU/TLO1PWyQPHBYXg==
X-CSE-MsgGUID: RqbTcHXUSfCDglvNm+tC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="78937493"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2024 04:26:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2U4z-000QEf-1s;
	Sun, 20 Oct 2024 11:26:37 +0000
Date: Sun, 20 Oct 2024 19:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sanket.Goswami@amd.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 4/6] i3c: master: Add a routine to include the I3C SPD
 device
Message-ID: <202410201938.oiMeI2Pu-lkp@intel.com>
References: <20241017150330.3035568-5-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241017150330.3035568-5-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_042644_264196_8C8CAF4B 
X-CRM114-Status: GOOD (  18.99  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i3c-dw-Add-support-for-AMDI0015-ACPI-ID/20241017-230810
base:   linus/master
patch link:    https://lore.kernel.org/r/20241017150330.3035568-5-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 4/6] i3c: master: Add a routine to include the I3C SPD device
config: arm-randconfig-r073-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201938.oiMeI2Pu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201938.oiMeI2Pu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201938.oiMeI2Pu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i3c/master.c:21:
   In file included from drivers/i3c/internals.h:11:
   In file included from include/linux/i3c/master.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i3c/master.c:1910:33: warning: variable 'i3cboardinfo' is uninitialized when used here [-Wuninitialized]
    1910 |         i3c_master_add_spd_dev(master, i3cboardinfo);
         |                                        ^~~~~~~~~~~~
   drivers/i3c/master.c:1856:40: note: initialize the variable 'i3cboardinfo' to silence this warning
    1856 |         struct i3c_dev_boardinfo *i3cboardinfo;
         |                                               ^
         |                                                = NULL
   drivers/i3c/master.c:2324:12: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2324 |                 status = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &val);
         |                          ^
   drivers/i3c/master.c:2324:12: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
     550 |                             acpi_evaluate_object(acpi_handle object,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   drivers/i3c/master.c:2324:38: error: incomplete definition of type 'struct acpi_device'
    2324 |                 status = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &val);
         |                                                ~~~~^
   include/linux/acpi.h:801:8: note: forward declaration of 'struct acpi_device'
     801 | struct acpi_device;
         |        ^
   drivers/i3c/master.c:2352:27: warning: shift count is negative [-Wshift-count-negative]
    2352 |                 boardinfo->pid = (val & GENMASK(47, 0));
         |                                         ^~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 2 errors generated.


vim +/i3cboardinfo +1910 drivers/i3c/master.c

  1819	
  1820	/**
  1821	 * i3c_master_bus_init() - initialize an I3C bus
  1822	 * @master: main master initializing the bus
  1823	 *
  1824	 * This function is following all initialisation steps described in the I3C
  1825	 * specification:
  1826	 *
  1827	 * 1. Attach I2C devs to the master so that the master can fill its internal
  1828	 *    device table appropriately
  1829	 *
  1830	 * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
  1831	 *    the master controller. That's usually where the bus mode is selected
  1832	 *    (pure bus or mixed fast/slow bus)
  1833	 *
  1834	 * 3. Instruct all devices on the bus to drop their dynamic address. This is
  1835	 *    particularly important when the bus was previously configured by someone
  1836	 *    else (for example the bootloader)
  1837	 *
  1838	 * 4. Disable all slave events.
  1839	 *
  1840	 * 5. Reserve address slots for I3C devices with init_dyn_addr. And if devices
  1841	 *    also have static_addr, try to pre-assign dynamic addresses requested by
  1842	 *    the FW with SETDASA and attach corresponding statically defined I3C
  1843	 *    devices to the master.
  1844	 *
  1845	 * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
  1846	 *    remaining I3C devices
  1847	 *
  1848	 * Once this is done, all I3C and I2C devices should be usable.
  1849	 *
  1850	 * Return: a 0 in case of success, an negative error code otherwise.
  1851	 */
  1852	static int i3c_master_bus_init(struct i3c_master_controller *master)
  1853	{
  1854		enum i3c_addr_slot_status status;
  1855		struct i2c_dev_boardinfo *i2cboardinfo;
  1856		struct i3c_dev_boardinfo *i3cboardinfo;
  1857		struct i2c_dev_desc *i2cdev;
  1858		int ret;
  1859	
  1860		/*
  1861		 * First attach all devices with static definitions provided by the
  1862		 * FW.
  1863		 */
  1864		list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
  1865			status = i3c_bus_get_addr_slot_status(&master->bus,
  1866							      i2cboardinfo->base.addr);
  1867			if (status != I3C_ADDR_SLOT_FREE) {
  1868				ret = -EBUSY;
  1869				goto err_detach_devs;
  1870			}
  1871	
  1872			i3c_bus_set_addr_slot_status(&master->bus,
  1873						     i2cboardinfo->base.addr,
  1874						     I3C_ADDR_SLOT_I2C_DEV);
  1875	
  1876			i2cdev = i3c_master_alloc_i2c_dev(master,
  1877							  i2cboardinfo->base.addr,
  1878							  i2cboardinfo->lvr);
  1879			if (IS_ERR(i2cdev)) {
  1880				ret = PTR_ERR(i2cdev);
  1881				goto err_detach_devs;
  1882			}
  1883	
  1884			ret = i3c_master_attach_i2c_dev(master, i2cdev);
  1885			if (ret) {
  1886				i3c_master_free_i2c_dev(i2cdev);
  1887				goto err_detach_devs;
  1888			}
  1889		}
  1890	
  1891		/*
  1892		 * Now execute the controller specific ->bus_init() routine, which
  1893		 * might configure its internal logic to match the bus limitations.
  1894		 */
  1895		ret = master->ops->bus_init(master);
  1896		if (ret)
  1897			goto err_detach_devs;
  1898	
  1899		/*
  1900		 * The master device should have been instantiated in ->bus_init(),
  1901		 * complain if this was not the case.
  1902		 */
  1903		if (!master->this) {
  1904			dev_err(&master->dev,
  1905				"master_set_info() was not called in ->bus_init()\n");
  1906			ret = -EINVAL;
  1907			goto err_bus_cleanup;
  1908		}
  1909	
> 1910		i3c_master_add_spd_dev(master, i3cboardinfo);
  1911	
  1912		if (master->ops->set_speed) {
  1913			ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_SLOW_SPEED);
  1914			if (ret)
  1915				goto err_bus_cleanup;
  1916		}
  1917	
  1918		/*
  1919		 * Reset all dynamic address that may have been assigned before
  1920		 * (assigned by the bootloader for example).
  1921		 */
  1922		ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
  1923		if (ret && ret != I3C_ERROR_M2)
  1924			goto err_bus_cleanup;
  1925	
  1926		if (master->ops->set_speed) {
  1927			master->ops->set_speed(master, I3C_OPEN_DRAIN_NORMAL_SPEED);
  1928			if (ret)
  1929				goto err_bus_cleanup;
  1930		}
  1931	
  1932		/* Disable all slave events before starting DAA. */
  1933		ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
  1934					      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
  1935					      I3C_CCC_EVENT_HJ);
  1936		if (ret && ret != I3C_ERROR_M2)
  1937			goto err_bus_cleanup;
  1938	
  1939		/*
  1940		 * Reserve init_dyn_addr first, and then try to pre-assign dynamic
  1941		 * address and retrieve device information if needed.
  1942		 * In case pre-assign dynamic address fails, setting dynamic address to
  1943		 * the requested init_dyn_addr is retried after DAA is done in
  1944		 * i3c_master_add_i3c_dev_locked().
  1945		 */
  1946		list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
  1947	
  1948			/*
  1949			 * We don't reserve a dynamic address for devices that
  1950			 * don't explicitly request one.
  1951			 */
  1952			if (!i3cboardinfo->init_dyn_addr)
  1953				continue;
  1954	
  1955			ret = i3c_bus_get_addr_slot_status(&master->bus,
  1956							   i3cboardinfo->init_dyn_addr);
  1957			if (ret != I3C_ADDR_SLOT_FREE) {
  1958				ret = -EBUSY;
  1959				goto err_rstdaa;
  1960			}
  1961	
  1962			i3c_bus_set_addr_slot_status(&master->bus,
  1963						     i3cboardinfo->init_dyn_addr,
  1964						     I3C_ADDR_SLOT_I3C_DEV);
  1965	
  1966			/*
  1967			 * Only try to create/attach devices that have a static
  1968			 * address. Other devices will be created/attached when
  1969			 * DAA happens, and the requested dynamic address will
  1970			 * be set using SETNEWDA once those devices become
  1971			 * addressable.
  1972			 */
  1973	
  1974			if (i3cboardinfo->static_addr)
  1975				i3c_master_early_i3c_dev_add(master, i3cboardinfo);
  1976		}
  1977	
  1978		ret = i3c_master_do_daa(master);
  1979		if (ret)
  1980			goto err_rstdaa;
  1981	
  1982		return 0;
  1983	
  1984	err_rstdaa:
  1985		i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
  1986	
  1987	err_bus_cleanup:
  1988		if (master->ops->bus_cleanup)
  1989			master->ops->bus_cleanup(master);
  1990	
  1991	err_detach_devs:
  1992		i3c_master_detach_free_devs(master);
  1993	
  1994		return ret;
  1995	}
  1996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
