Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD8BCD8CAA
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJuE3zlhtuhnHltgk1Cq2XMnHJPVmH0CiHColVGb8p0=; b=zRin8litXh+aFX
	3V/sqb2mCP8Pa+6n9dUD/Wk2wFA5VoQx6bV6gkEPejSIqQXq0bwPaFvMZKDFCMfCQenAnQla4q5dD
	SjiCJcLMt5xMN/3ecFw31pjmg+UC7A2DoxXGZ70yjVjBf4DMOmxn5spSlIbHUL6mhtEmh/IuHORkT
	AySIV5Pb1PZQIZggyRdC0tvcyAZHzvM6FrbYCw+xlI54GfFZhg9opZY7MdUutWUko2Ta3hCM/GOSA
	Xz6Tfmzr+aXMyDhrC/FRt1NJKcgPuf980RUgMmVvV3Z3DTfQJMXLa14vkc11vsrmGO/nLh50THybF
	tqFE4Y8x1EzZO0JkFz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxKO-00000005l0C-46ay;
	Tue, 09 Jun 2026 14:21:17 +0000
Received: from mail-swedencentralazon11013049.outbound.protection.outlook.com ([52.101.83.49] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxKM-00000005kzd-1ouy
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jun 2026 14:21:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZJOw/ux7ZhlWRcvj+85MRzzHuCGb20Ks77m1I9iBbTWDE4z9n+wifrLaawBbdVNy1Gdhvf0JlcsHSGRbP5UxibN90kgshGtmOmzFta8aoHDTBvbMsJONIx6h0xVdkIHcibSkXV7xdr2QW4+lBB7AaFd5yat/yL1k7aMQwhllYCQ+ZPtoEW0EiFmp1mzD5Gjbng70ij3PlswyDCQqi7UXEncdC3HvV5Nragg7VFA8lLGhtMKkx/g/FOb8HJq32KaZD5LyhSi5tLF2zaLYBAZW8An1rqdv7mKRr6LXKoH3/MwK6XTOK74+htp346NQ3rtb4D4HLG+vUW4Hr6lLAno+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsr413P6gPTBkGArrQaH+c7dGW3DJWlpCRGik+9gLII=;
 b=JXyd3vuiMbGvZNEYKQM5t9MJlR2DbJLaUdBpEr8FmyxAg56hpVDBzIygG3N4h/sK48S5CtX2Lhgx0nntMDykaSf0T5W1QHGdEMWs85HxZsB3CxrhpuDnsJiSgcvjfLGmzRTTUvXWY5NPMMVf10+3cIL/SyHpYcsrCgAK8lhKFHPFimkvrlKXHxNNh5yRIbKjGcMRz/V7nNHWYIvemQQgPS9Qeiq7K0ykw/WW+fze8anyhFvk7E7th7hM3PxfyslZPWQ1LL733JU43HwmBK/PQkfhfYlBeFZaWYoygZv6oKPZhUB098LN3VSf7GKrPJJFzwfZkRYBIWDeWUjUHo8DCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsr413P6gPTBkGArrQaH+c7dGW3DJWlpCRGik+9gLII=;
 b=YvgUHwcs3TYZsOH8Mugkp9KwXvAAFly0S8TlYCBymuLs34t4oJAtsjwrXDuPL/Tkgei6F7mOsx6KSNyXKPoxNeeqUOxBY/j+KKavMGHdqCC6XZqeWIKxWTJktb1/hA5vgHN3k9HX+p95K/fetZuL79+a3W37qVaEmvFtd326aEiZS97rHmdgx0aq2mhu6HkxAakZAI8QFM+DbPm2alVjmoHC2XIVNYF73RdQi6Z3ViB72gBRB4mvmEOcjG6YznNetr/Hxx6Y33FtbgaTGnPG7gIaiNcdd4GaNrZJUzRzKNwlStlKijQ5gRSTSbHaoV5BDBbVZ6ZaTUZZfiIUJ2s+HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9998.eurprd04.prod.outlook.com (2603:10a6:20b:67e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 14:21:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:21:06 +0000
Date: Tue, 9 Jun 2026 09:20:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 7/7] i3c: master: Reconcile dynamic addresses after DAA
Message-ID: <aighSvgqAn4ui1OM@SMW015318>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-8-adrian.hunter@intel.com>
 <aicEsjs6oZxp7R4N@lizhi-Precision-Tower-5810>
 <aa430bac-9098-484f-8f48-15a678905430@intel.com>
Content-Disposition: inline
In-Reply-To: <aa430bac-9098-484f-8f48-15a678905430@intel.com>
X-ClientProxiedBy: SA9PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:806:24::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9998:EE_
X-MS-Office365-Filtering-Correlation-Id: 5129f02a-03cb-400c-05e6-08dec632580d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DS7qoblGTggkdLMh8Hbzr24RrCEWRFC8p2YejSFm8arR1EGXE/Jz8l7cFK2+IJ+EeeE//5BcE1GU3SgsSCbfHmNTnnoFCgTB8OYRTEni+ywlVKRmc/YmAsURE13C2SZQ8SqmjF8ksOlLHWE5Q8dfpma7A3co9FWMESvR+Sm3YbysIBG4ET17NO16KA5b0Fjju56hbvojVWFcaYTdF2QnvdV665mAjGsuPccoUf2R705lOTqNuvGxPHUOjiYgmDHeQOVTts8vHYRUykoBY6+58J1tjSCdta3ej13EwMiR8FG97akxt+ZFHeEbUvNXbIo1BJME+yIhOLefbejEg1pZD4KijH1vq4ZgBxLsREH/bCOUpaz6x+n8R4ym6vMT6xLys+OMO+ilz6wzvWKQyjZPHJUwlJwBTvVwa/ZESFCCyKLTv+gmcdS7BYJrCMa6cRfXibKjaD2k7iNDt3v63QYJ8uQiJtyw6v33/I50ZTC4tZ1wFWS5R8w+pJts9lnO6NVS0q8HBDzUg2vyFDNYCdj9Z6j2+ur5LUsx3f7sEPc3ccVKC8fdGubYPWmadwppO533aqShqnPi6J/V8x+vBGdP8aeRYQH0vQzMbfNX4XpQiGAVjh+srPVgqNsL8swi+7H9OVAsF2FNqnkjs/1p5ykO8k9UiPYNLAUoAhHg1Fp8QDLKTrUQKo3LfvBml0EI4lIs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GrH/eKRpjtcLXdvLdbYXH8SV1IENHxl3tig0F7Bzk0ntlEKywTBGsg7ryghQ?=
 =?us-ascii?Q?8DEN5UkS++j1NiXgAksrXnVMfJ/hqJInHU3gdanw5ejOPaoFBXTxTXNfSoli?=
 =?us-ascii?Q?FS7D/hjgKoETKAGLZnRZiQY6HhXVTjdBpT3k/r7iQjx+BcKBgCGw2RrSVZ9J?=
 =?us-ascii?Q?2T/JArg8uEmOb1Q9DJkO//rpLu1sAzUXe8GsoWOmdQDqkyAYanwYmZbadRqK?=
 =?us-ascii?Q?Hivb42Te37vhWfPQwpi3CW0rKYWdMiQjExOT6qpxzxUxAb9aJ2sHGIXPLEd3?=
 =?us-ascii?Q?McBuYCyr7N4OGzlqZ0Fk8oyN8mzSjiQYtj5nwwDx0/zcn7f3B/+fO38xfAOv?=
 =?us-ascii?Q?Z1z8nq7iMfabFVQAgGGwkHrJpf8bnqwok4ppdf82l5vn1wKSznjJDq251uVF?=
 =?us-ascii?Q?0szbOAMuMUN+nXckMF2We58mz+bHACDjHu3oZHt6c8lEOHAq3Geeskl9S7Bm?=
 =?us-ascii?Q?60yZSjYIwYVnsdTT5IOeOGFasCV+R78C0nDohx903sHfOa4GC/wg6PkRLldn?=
 =?us-ascii?Q?JFkLXK0noFh9AFDMS6LnPo5FhqclwGX+2YQCfUXTVlcBw/XpZvCsHAzSJ4i7?=
 =?us-ascii?Q?rvwhJVEInASTX5XbPD1zvIuk9SleFY/7QZEMOG6E7ijS1L5rDqtaA4KUEEpC?=
 =?us-ascii?Q?UU8Tq1HBZDcJFxIE75ZYKzvjYGgE6cq4PHuH0GAt38rv0eltFKHEuc3rERkh?=
 =?us-ascii?Q?opjNP17zdkkPd7/4WLV1XXeOOsXPFxnoHnsBVY9sKW3gMtqbADyojebBUlo4?=
 =?us-ascii?Q?UoxUX4o1ap2wSd0jnHdWzLQIQ8EOAN6FxnU79rygbvnCnTdCr6Ssei7ncit1?=
 =?us-ascii?Q?0jLt/deKR7/uiCP0osQXxLQhlGWWEz8PVCut5zNMBdfodd+asyT+AQGlFK4F?=
 =?us-ascii?Q?ZBgrTioaztOhmPLcsp8rUecCUrn9otsSZ2XieMT4nQZxQUppihVRRkq558lB?=
 =?us-ascii?Q?ip/XBMldo0+K9IHh2D0TqoMnacsO73WKF7b+zAPKJ48QMG6CzNi4Tj6CqEMU?=
 =?us-ascii?Q?DSfsWLddYmrY9BGq0xHrXnyND3UTIqIda4HA/cp1hdYQxRyigFFxEOsIjnZf?=
 =?us-ascii?Q?Af5Hm1txcK8dX7L+FO3tolsBjqYgZcNG6DI3BwrcBPf8mJ60a0VtyD8XtS03?=
 =?us-ascii?Q?tlprxi5ldTRo02wSjEidpc2CtuqFMC5sFm8Z0glItcsJNjWys3EaVl3dNN3S?=
 =?us-ascii?Q?U5L6Xbu4+aayJ+fCbxFl1cmkPp2mPhJnesw0fq5q7ccbjWlB68rtY6f3qViP?=
 =?us-ascii?Q?9vvDE7V/FKWERxD5cI1CKlnVy8eYSo2iGMeFrbuVsbeFTipX3BT0rrk5fqxy?=
 =?us-ascii?Q?RMweyCbaKY+jE9qklPHzYyIrdykpX6zCNj2AKjbqCvChagkXoN3ACMBQP6tL?=
 =?us-ascii?Q?FtmBTj2XRV2aJoVyiwGOBpgv6xfaqkcPG0Q++gkuxC/tJ+hLWhrbZAlcAXUf?=
 =?us-ascii?Q?UbzOXGZ9Lpib49rG3Fq08AcJ7BxU3FLklUNWau7KHoDqDhP4SjbrDVHT4OdN?=
 =?us-ascii?Q?HtMvEWW7g2nZUFoG5fJlParU/vGVuROWYSu46WXUcnhftoPUhXHqjiE5kmXE?=
 =?us-ascii?Q?7LoVMlVP5ixvt0QZ0VuM9RUuvq7RplUm8ar05ua5brFPfhCqetiHrCi/rC+Z?=
 =?us-ascii?Q?HzxXIQ5m93Na+Xx4KlrgGUgBddXNBQ1VkHe14AbAjPLPlikw7jW3lmRmFg42?=
 =?us-ascii?Q?oLynTsjMBQDEpfeZizKaYcydchHkoPBatm1/s7BiP0dPXl+ziuzaimIQx0kF?=
 =?us-ascii?Q?dwryORjZnRVdknFH6W/gGt9BpUsC409AeGBCYNOZ6mLEWWyZK1rW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5129f02a-03cb-400c-05e6-08dec632580d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:21:06.4814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyGqesdFOpaJv5CDznmgo8wYFfjhNWZeB5Kvm9Q3nL+ukpV7yQRYzNa6xPkEfxUNBl9tV+9OsO1RSS7ofp/2neJvFvq3bN3NoQ2JW6tw8IN9JXnrDPE9RfFsRc60EV55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_072114_480986_15DFC29F 
X-CRM114-Status: GOOD (  32.57  )
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

On Tue, Jun 09, 2026 at 12:23:36PM +0300, Adrian Hunter wrote:
> On 08/06/2026 21:06, Frank Li wrote:
> > On Mon, Jun 08, 2026 at 10:58:00AM +0300, Adrian Hunter wrote:
> >> After Dynamic Address Assignment (DAA), there may be cases where
> >> devices have been assigned dynamic addresses on the bus, but are not
> >> successfully registered in the device model.  This can happen, for
> >> example, if errors occur during device addition, leaving the bus state
> >> and software state inconsistent.
> >>
> >> Introduce a reconciliation step to resolve such inconsistencies.
> >>
> >> Scan all address slots marked as I3C devices by the bus, and compare
> >> them against the set of devices currently registered.  For any dynamic
> >> address that is marked occupied but has no corresponding i3c_dev_desc,
> >> probe for device presence using a GETSTATUS CCC.
> >>
> >> Retry the probe (with exponential backoff delay) to handle transient NACK
> >> conditions.  If a device responds, register it via
> >> i3c_master_add_i3c_dev_locked().  Otherwise, free the address
> >> slot so it may be reused in future DAA operations.
> >>
> >> Note, i3c_master_add_i3c_dev_locked() may fail (again), in which case the
> >> dynamic address remains marked as occupied.  A future DAA will try again.
> >>
> >> This also handles a corner case where a device is assigned a dynamic
> >> address but not successfully added, and subsequently loses that address
> >> (e.g. due to power management).  If DAA is run again, the device may
> >> receive a new dynamic address while the old one remains marked as
> >> occupied.  Repeated occurrences of this scenario could eventually
> >> exhaust the dynamic address space.  The reconciliation step ensures that
> >> stale addresses are detected and freed, preventing address leakage.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
...
> >> +
> >> +#define I3C_DEV_PROBE_INITIAL_DELAY_US	20
> >> +#define I3C_DEV_PROBE_DELAY_FACTOR	2
> >> +#define I3C_DEV_PROBE_CNT		5
>
> They are somewhat arbitrary, but should give a device enough
> opportunity to respond.

Need comments for it in case someone need adjust it in future. if spec
required, it can't change and need consider more.

>
> >
> > what's these value coming from? from i3c spec?
> >
...
>
> >> +	/* Reconcile the bitmap with the bus address slot status */
> >> +	for (unsigned int addr = 0; addr <= I2C_MAX_ADDR; addr++) {
> >> +		status = i3c_bus_get_addr_slot_status(&master->bus, addr);
> >> +		if (status != I3C_ADDR_SLOT_I3C_DEV || test_bit(addr, dev_dyn_addrs))
> >> +			continue;
> >> +		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_FREE);
> >> +		/* Try to add the device, but probe to see if it is really present */
> >> +		__i3c_master_add_i3c_dev_locked(master, addr, true);
> >
> > If dev add success for addr, but you free addr at previous line, any
> > issue?
>
> Currently, addr is always I3C_ADDR_SLOT_FREE on all paths that call
> __i3c_master_add_i3c_dev_locked(), so this is consistent.
>
> There is no i3c_dev_desc for this addr since that was checked just
> above.
>
> Then a success path will use i3c_master_attach_i3c_dev() which sets
> I3C_ADDR_SLOT_I3C_DEV via i3c_master_get_i3c_addrs()

Okay, I3C address allocate have little complex.

Frank


>
> >
> > Frank
> >> +	}
> >> +}
> >> +
> >>  /**
> >>   * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
> >>   * @master: controller
> >> @@ -2445,6 +2551,11 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
> >>  		if (rstdaa)
> >>  			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> >>  		ret = master->ops->do_daa(master);
> >> +		/*
> >> +		 * Handle cases where a dynamic address was assigned but the
> >> +		 * device was not successfully added.
> >> +		 */
> >> +		i3c_master_reconcile_dyn_addrs(master);
> >>  	}
> >>
> >>  	i3c_bus_maintenance_unlock(&master->bus);
> >> --
> >> 2.51.0
> >>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
