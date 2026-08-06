Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1D9C56205
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 18:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRZwH0NYzvzfiE9AU9I4K3Jb8A2VeZrlxeGJbW8cOUo=; b=OQOk3rN28g3YNs
	PE4lMTSYKCPdE0wOfxhsugHxsyNIW52jVpkz+uTbtHwhrABhqa/SAdXu3hIoz79rlrR+aBvHQhU84
	tLPCOvi4VYCVS1tXVlx1a2yErKonTrxj++k36biSAVitkSngSO5x7ZKa7UveNwCZzN7/C92SSEtHC
	jt5NrN3LLsPJl4VssgCIdH6ajXSCL9FijFDXBMt7xAkWVYKoiC2WBOG0cvPdYIHAIzveNSzFztDlU
	Qtp2iYzk4J4GhooH7i/knND/PZDU9dHm2G+WLaaqit9XknTQLHwduxvophF5fBYdtC0RRiE4Ws9LU
	lPnP1aob3oMwJ78LbNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2ur-00000006Uoz-3Xma;
	Thu, 06 Aug 2026 18:34:05 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2up-00000006UoW-1oVb
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 18:34:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEW856qqOxla3ev1Tp40ga+EcCu1qAIN5bCO/iAoRY9B6tHHfuY3gYSf12kONBynFtumkmkgHCO11YmSQwHMQXEoBY8CugCpuuyQhvnnBzL9F71KmIcwnAfaCCwjZcGYNjAXiHpdmmb7SjCCPx0vR+f6hcTTKaOxdr00T96DZewr+Dp5CYGKTgN4xR/HnwuhfGva55ZMtf9MqCD2DZEalDavqaqh/3gezR7dCZH38bfFMP66r27CAx7A37l+r205NmkSm2DAy2a6eWXVsNAftk3jfkWCMCedf9h3iQ8DDBPx6lk3Tpk1B1WZWVC0hbiqLmluewTiGGh+HUfZd03o6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfldCtsPa2Ntj6yQczYRbEHf8JiFhgE2xiry9j+Ge00=;
 b=Ji0Ka8wUQQn68cWdfj40wSAio/5ZKhCW/iXbsSFHGjRFlWUY/oYZyvKlyH/lesOML3Yu4TJ1Y94ZGG2CQaZo6LzwJLSPVTdYX53A47VmRiqBbJV/MpdtWHZuMHXMBYXetH0zCSZ8MF2euaRUHEqh1UmS1H7ZCtCqecIUZcIjh5SkIPPVmMuaODtyenNbouZILIj9MOGTPvXGaACvC9CQnN2eR23uDsIDCMS1Gq+6aKVWpUzKqgdJnn17dYTji0QFMS8x/Z+uqtAyz2+UjEbyqXjIhA826OmNwFqZdjxh/HDRRZ1uV+WsJINVyir2UvNun2TxrHE8bHSyDQDJ2Vc6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfldCtsPa2Ntj6yQczYRbEHf8JiFhgE2xiry9j+Ge00=;
 b=MJ84U8Sm0wG5rE2fUhI30cTONzQPdz8t091YFt4R5rlRaYyHjJEVRbK2vFWMHO6Qf9E3NcQ7yZqIU+xKqf8pCszx/y/ubRaM+O9Ehx+b8Fqoze3ZZyrEXXjI9eOGK9qZTTwhjapQQOhgcVLNC4zZ9E8iJZxkGvY+98g3tI1Yn1hgdC2A3Y/krnAUP9G1Hh3jAsi1dhSwoRM+q1GIJE/hbSGdm0Az6NhCvTKAva1llPC+/Js5OnEVwPZisMWi9017CEF/q77SR+qBg44Iqid01cF1VmJLN63u+u5DBwEfa3U9o+h7KtvI3kP0LOWEsIjNlDbLUCcgEA2GSdUMbD48Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 18:33:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 18:33:58 +0000
Date: Thu, 6 Aug 2026 14:33:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, akhilrajeev@nvidia.com,
	mukesh.savaliya@oss.qualcomm.com, rafael@kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH V4 06/14] i3c: master: Fix potential UAF in
 i3c_device_uevent()
Message-ID: <anTTj1y-vlmqQRcl@lizhi-Precision-Tower-5810>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260806131857.119830-7-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:806:122::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b1a0a2-a345-4093-a084-08def3e94764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DWrQbvSsmGKx62qsPw6APUJSNJ+2liPKFR3Pf7MhAMdtamM9dx0Ycp9o/fXjHVVNKM40NLqNP9Qfw4HPMrsrOZbWDiqP2O1OrDIOGnaW0tD17xit5+URzYKco6VikZ/PuHlksvRZbJF/iCfhaC9X5gUoZ/DCO11OXZZkXa5Fqdjojd89ufWgu5gGiEvrnLY7tgxCgl1up+a3XscTSQFtSCiYfcGLc1561MfPfxVAxkimCgAW5274OKLncAWtqlLAnGJZwWDWm7xyotTUT5XPBlt5v6vRfpJLu1HEooPFAgJ3uI/AjAmsJFfXT7z6cpyzZI27pU7/huTBjHkB8Sfyte9W7SQOCKGxnPYNjTW4mNfa4mUYARt1VwV5PEDeaBwpy1oiJXJQQsHFInjMXmeQw2emeOsJ6KipQfYO0rKMvdu770Cmmuv9rvuUFOz0fRkmRutkU4DuE9ED7jaTLsEt5FaFOdUaUk9MSiyOJFHgEKB5bjKJkuOTr6t/brfn03JRNOttoKYvC0JA/NsvSpPWz67T2sDKhLjjE6Vn9brVX/DRvn4D4DFGlFB/BXpxlggs7BeaSljjKTSPTEZ0pKX/o7pct1I2GkhVTs45mzYWU5xyLxWLEtcJZF9Zm022Bcc/iboffgMw2goZSlfn5WETtfdFzVkQyskgva/ARcTIvPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EWY0tksF9Zdzhnza3YJwPJuVccuGRE8sokrx42Oh5uhyFf0q+kyRexoDt7Wy?=
 =?us-ascii?Q?MJI/UUON2U7Onig0ESg4VUxt7YRxbetb7Hro186VC3qVx1tAYUglXIdZ0MOt?=
 =?us-ascii?Q?VGzu+tkjUJ/lPsjPfAKVzyrbU+kiBeG2EoheuI/HGjOOWpMG5l0XLOIfrV5U?=
 =?us-ascii?Q?pcQLM+HBLzURBSUG8yeFVRMMSZprZJjwLVyoQeJANb3yshy44JK+F7MmqcI9?=
 =?us-ascii?Q?HhTNVMjy5WjES67dfAkSOXLnEFABR1azWKYvtcO1cvie6WbjUETRUbKKmMqr?=
 =?us-ascii?Q?CUwk29vDbrHsTBqtDVsn8EIZXKkCr/18LO/JdmfFaqfZquY/P8DT/xtj2a90?=
 =?us-ascii?Q?EqVZ+zGv3W+vEV8V8Ok8rkhekygB8ZLLPQwhTCW+VUbm5o4JUrSxnO9Hcktd?=
 =?us-ascii?Q?FXsKHiEYwILAYv5+98qJZD4fCRSstqCE9PTpOso3rQgt5Ny/IZESoAXVTwvR?=
 =?us-ascii?Q?rnvvkc2JcbShBc/KYGHmKsKIq6wNCSfx82NbG1HpJOLuLeJxikWXXcYAa3dO?=
 =?us-ascii?Q?tl31ZSUReKBdRQez761hOBYmaqY22UcJtk5L40zJj7ol9RzhHFjgqlCVJqww?=
 =?us-ascii?Q?0BNYMlBe1lFs7IvF4SL63g2ermt5bMuqtwWxlX8jYyzfFmPCjFLAfFc1u6il?=
 =?us-ascii?Q?ORkyDCIeCGBwB0kM9L3z6yyk8voeRX/zPFZaEeTkMoCRFzDNZj5KHV1gS3H+?=
 =?us-ascii?Q?gGcwNlDdwrzbDjixu9xsumyz+GUlDrNaFfOd1Y+GA70bnACGQ/xPx4oHvqep?=
 =?us-ascii?Q?H3hltwMD6Gy36mNPymx8z6tF7SYdp0NILuEW9VBDNzNYRA8CccBdlO3UWW8f?=
 =?us-ascii?Q?LI88VstxkqE6NpcjYWJZdaM42XUEZn1iw/vAJNYIPGeOyGtBRURVDZfOXJ6p?=
 =?us-ascii?Q?p8pi7ZZdrFMKWd3Vhd1WqPnk9kiA82qHsC7aXGNrEJB4VwmaZ3RYaZyCbwyF?=
 =?us-ascii?Q?DRTuDBql/qmo1/ngribMAlJnkIYGUcx+lP7wVN0m2QojW+zeOhwSruWRTqLu?=
 =?us-ascii?Q?oo/6w+mV0pNrBkJJqwaaillpMYsHbmXd8bpbWyCAHXjTCnaYeHkDXFo8vNUR?=
 =?us-ascii?Q?ykIc7ucv6y2q8BFrfOLVBvqrOcyqYTHGDlkyrK+pwiPMoa7zJCYX8Nw20c4K?=
 =?us-ascii?Q?6YgzhnQUqkPHAlGTqMsHCOxFtJF+hXCvsKihbBKZ4xgm2+GRNM9ySg8I++mk?=
 =?us-ascii?Q?C90twA6ZFcOcfD43spvaxFG8KPKRA1HTeHP66Tviyoz2lAobxj5Rf4x1POI4?=
 =?us-ascii?Q?7pVJWw38yzA06B2mOfd9UTeKEgMfAc8y9avWwWrhofM5PoGrzSWNmlc5cm+v?=
 =?us-ascii?Q?R82aX2n4woYEtr8sSDWH9bHLBHjYCSzMq3A1j+CwgKZZxKpSlelybAwOq5oM?=
 =?us-ascii?Q?13YroHUkPtTWg7y2P3rIJcj6nuuSyBDtMQV9rpGagxhR1L4wT9sdzVAfSztF?=
 =?us-ascii?Q?hkgIBLE2xCjVcAEN8D6RMDBUvNickdAahBmnG3jVY7Q6QgmXO5l66rO0udde?=
 =?us-ascii?Q?Lv9wJPf++M/4rTVwkWguXPAyD2M8jDj7V+9bEdyzi/9vtvuJIfEdkt21D4bH?=
 =?us-ascii?Q?qWPAUf5B7dOFStHbfl1pAujr5eVzma6IOPO9wBcQsqUdlmiUqWHsJ+VowKAH?=
 =?us-ascii?Q?g6koC4oJYUMinBBbcs7X/uhXjvK4+fJjWZXOtrKzbp1kcKOy3FRDbH+cZuML?=
 =?us-ascii?Q?AzORyhkx3aMhOeR/G3cTjyddKkUUHxL5YKJV9OcQUI07RB5fdp3aAzNBl4pw?=
 =?us-ascii?Q?NZAN7vrEPrYKflwDPixSn2nE1bkqjxq5QuLNsNeGoO9D8sfcm/kM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b1a0a2-a345-4093-a084-08def3e94764
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 18:33:58.5816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmcInSfvaSc6OGvl5kHw6jKZAyX80sFg4kcDWlZEsVwCcYDyzN47e5cK9iBO1BOtVQlpB1TdkbdL1cW+WjJDcSBuKV7thJpG8eLiko9PErf/VYVGdVa1jNSq7dLVepIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_113403_472999_BC385569 
X-CRM114-Status: GOOD (  20.62  )
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

On Thu, Aug 06, 2026 at 04:18:49PM +0300, Adrian Hunter wrote:
> i3c_device_uevent() dereferences i3cdev->desc without holding the bus
> normal-use lock.  Since the descriptor pointer can be replaced
> concurrently, including when a uevent is generated from sysfs, this can
> result in dereferencing a stale descriptor and lead to a use-after-free.
>
> Use i3c_device_get_info() instead, which protects access to the
> descriptor with the normal-use lock.
>
> Commit 6cf7b65f7029 ("i3c: Use i3cdev->desc->info instead of calling
> i3c_device_get_info() to avoid deadlock") replaced the accessor with a
> direct descriptor dereference because i3c_device_get_info() would
> recursively acquire bus->lock during device registration.
>
> This change depends on "i3c: master: Fix recursive locking during device
> registration", which moves device registration out from under bus->lock
> and removes the possibility of that deadlock.  Without that change,
> restoring the i3c_device_get_info() call would reintroduce the deadlock.
>
> Fixes: 6cf7b65f7029 ("i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock")
> Cc: stable@vger.kernel.org # requires "i3c: master: Fix recursive locking during device registration"
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V4:
>
> 	Added Mukesh's Acked-by tag
>
> Changes in V3:
>
> 	New patch
>
>
>  drivers/i3c/master.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2357874bb9d6..ee771ac0b203 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -316,8 +316,7 @@ static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
>  	struct i3c_device_info devinfo;
>  	u16 manuf, part, ext;
>
> -	if (i3cdev->desc)
> -		devinfo = i3cdev->desc->info;
> +	i3c_device_get_info(i3cdev, &devinfo);
>  	manuf = I3C_PID_MANUF_ID(devinfo.pid);
>  	part = I3C_PID_PART_ID(devinfo.pid);
>  	ext = I3C_PID_EXTRA_INFO(devinfo.pid);
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
