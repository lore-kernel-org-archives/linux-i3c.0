Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC948CD6E79
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUONrpg5gTf1D4nnVxZHLqi4bnnHYtr69CVP+Mxycww=; b=Ci6U4Ggyiw2ADE
	/1rN0un7b90iMyNwWP4jvY7EPqht4GxQQ02UFpwLT7yCMDT0RysD40buy+nHS1fuidDLpgrWrGRsM
	bLrsiwyohUd0949WZTiTBFB+jPy24TZQzmeUTXoD0DEd/QnPnVSpqKy5859nbJxkSAa4DM5Z/d7G8
	F6NOL95YdmYc2K9C5IdLUrj9LXCmLbs64lqDAAfu7b8ObimgkeV+FXdweOou47IaEzhOonHN0pyLB
	5/FiUaWEoLqsU0XYCVXpikn3IVaYtk0zqAqiLqRjIOdUA5AAZGLGTKWj3BznmbpjyLb9G5SPjKMbI
	lusLNHzRhWqrCo01s/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe9E-00000004DyG-1IDe;
	Mon, 08 Jun 2026 17:52:28 +0000
Received: from mail-northeuropeazon11010046.outbound.protection.outlook.com ([52.101.84.46] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe9C-00000004Dxf-3gqF
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 17:52:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuNhyuw6UID14lizB2xAjwDmDIlmmGkkCQVjtP0VCXmZmEmqKNEo2x8SvCWNJRL/B95Rvge5skRru8f8JrsFBAsKZrnOk1ELK+cOKZLSEHMQxLmjbU4grLwWBsCacVVRSXwxMr6cjlgtoYobUylg9Oy61RXL7aLDOSemMosDbPJRZkxt2Xxu8A140hKuOUHzpgylzOmyvN8850ZZL5BzmA/zoNWcX9bJDs4SZC4JJ3AhkkQ0NkHrQX8yobcniEgzAJEMa2VGpZQYUjL2jIB1pBp9W1n/LHaziZwBFudwJtv9R72WrbA3IfGNQ1f26FDedgmyaRDODJ/r3FfloBVucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Acz0l/mmN6sAcQ7vlv2L5s+0vVdeeLgporTsMkJVd68=;
 b=u4mnxWneTyH917Hjq18epmyOnU+R+O4CM6dj7gnpLgaMCcHcCqW1z3fueW59Ix0yCFsCPWD1tGx9d6rE/HdZ6LIekzbSa3YlWHFKwG/sLsbkBtGNo60wH/80U3UIH9jsc6PN+TGwiBfIs1O6u+IMullGeIuHnJjs2xM55PdCXUxyK+WE2niI9x3CcEsX787vS871iPHtgd1t9TRQMa5Dy3o68RvJPpswbLfRZT85xpjWJeW4k6PgjNuSCaI5QeuAL1n9AD1eqtbuiBoMIEqhSv7PFs4V/OgWniTEyA1kGYz5kAFvRyH/ev+CSu/wcd1Up5xGZIminZSczfBVWHpF7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Acz0l/mmN6sAcQ7vlv2L5s+0vVdeeLgporTsMkJVd68=;
 b=K0OL8FORx6vnv09kRE6bIx3SbzbY98VUFlTQY4bFZbp20kgcOg7TCLwXpmbaZx6I6x6Vt+orpQ2UGX2CugW8YcSUDJ3QRShwPrBk7oLk+rvNXKnQXqwkXQ2B08RS876fIZ81y9kXKDHv1yWDXDII9UYdRTwrH1Jrjfpg6KMbBlmnTIfjzubViuDQY6sm3Vsp6jaeUyUBDyAtP0S06DxbKDLiZGiNqH2gzeHlcN55im/eiG4uXSFZV8uecM3mEKP55XMNcqGSvkUo7XntVf9PIFB5w8qcr1xNdkA9QaBnYTH5jwpJ5Z1km7UJljcooX3g2AC2aMQnBigElCLyqNajhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8194.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 17:52:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:52:23 +0000
Date: Mon, 8 Jun 2026 13:52:19 -0400
From: Frank Li <Frank.Li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 6/7] i3c: master: Move DAA API functions after
 i3c_master_add_i3c_dev_locked()
Message-ID: <aicBU28PHpR8_7-g@lizhi-Precision-Tower-5810>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260608075801.16111-7-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0087.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 6537ffb7-bf5a-4866-0dd9-08dec586b1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XG7VNz5MKnQ20c+c6eIiLftK1Kx6WYqIKM+KbGcfyqMhG0+HU6jvzkYYOqX6KzI+t+vfwnux78z9Xd4NAgLU+kewjy/p9bAcCsDFtXiORSmNvuTxxrZQ4a8AOo59Yqs+8tx7Herg3Zxo8P0a1s+1/atpTZgcDZ9oV8aVwTyHGyGYUfx5LZTkwp5+v1v0hwNXgqutgov3UrWHm7mGWGatH4lesBvt648irOgOCt33itOYwppcEb4ekGtVEEzxYOXVcllIyf1BNldi1Hd69AKkAGyGDPqEdBPa+336re8RD4SKM/O16soB+Z1eTrHQeTJYdHu7RINnam5oFGXBGsyL42aJNOjldncVp1wxhfVK4dKI5lEhkmrMntM+69fkeUF7dQGTugTpv1ydPbBg+E2wQ5GSU/oCh6ce0L5Gp6Cyy1MYpn6UmC0VdX+U3gNWaLUPhYv4Kv8uPZl+z/S9PwJ7+DswIAWiuKzZKellKw1xXvxwnHxBtNXQ8z1dz7/R13grOcKAKOFo8C8LYY8hpOYil9ol1RwL82aTl4gs/MepuHdYfJtNJ+5+zaK8YzDlk2KO0icIItV0M1+8yddZ1khQRyp8zrBl+sZrpNHvzo+rGef1E0Vt8aoVApDM0ZjmYpU/EvbB2HJTpnE4DduqGmAP5iSUfjYk/JJHHFtTbfS0vYd1iadKKeTbHIPkqfSIKr5p
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wRAFFMO7B2+6OW11SXK/PPVYdX2/l0bY2j0oxroId5Cn2KwkNx2e9heU31vI?=
 =?us-ascii?Q?45FQajraNt/iW8OZmvE4nDx0CXkfQXXZGqGbConiVsCrB5H/8Sqv5hIz3idh?=
 =?us-ascii?Q?8egkcLTCEyA/QN3WdfzFigKfY3bjx8NibMWzAAXk2lMkC8nBKyQ8HZ4y3AQs?=
 =?us-ascii?Q?PaLEhax6wW7lSltPxgGRJ+/muMquw2UY0X+lth1HbNnp02CiZcittZOHXEFI?=
 =?us-ascii?Q?TnYE1eX97p2RJV4P8lUSqz0bW4/D9cSlbNcXuDYI+Jej/EFiP+WcA7+24xsF?=
 =?us-ascii?Q?o8dmyJgGjfnqlQCQs7jf7sstA9hTRXOsPJ0LCpLFkw5M2bSdAIlFpZSkhk4E?=
 =?us-ascii?Q?T/e/gyeQWYRTNpiRhAPqJsPsvg4u4LC/ZzYxSdJMNhZoaaRheXFkqu+ZBmWr?=
 =?us-ascii?Q?4q6aeI0Ji3idbIVaHt3q4iX6kr+ca4bF/W2DQla0pFsKoUhdkcUqlYrWt++W?=
 =?us-ascii?Q?tU654wzWA1YKtAPfB26D/DRm5K3QMxW/YR2hl+boV6A115Y9kj7QGW6T3Nn1?=
 =?us-ascii?Q?/Ey/DZryHvVutS9zu+R+byPk8Ge98KfD5JxiRXYSNe+bH2aiquJnmzTxb9F2?=
 =?us-ascii?Q?MOdPGQFnZQiWK+JYqE2EONGUU5lm0TbN7lsWYCuvSpDXIV2VQdOKMcqkjll3?=
 =?us-ascii?Q?OxG5fB2wpbVeunvh0YDkkkVoF6zvlEk7ru160TdfLZL8cksoSKwzZz5pbvzo?=
 =?us-ascii?Q?EQDHwzvjZX4g4HSE8XNqppNTpySba2yp5Cw03VXXbOb/dLzOYx+cBvuC+Gts?=
 =?us-ascii?Q?r7XipiiaYj5w/Ohqi/p+8lUZQtuKv6O2p2U5fD85D3kRdSsq8MkFNvgfyDJ5?=
 =?us-ascii?Q?VqiS4ik4HKchdA9NnkuAAHLpEGrYshj1kHWqQFWYbYx6aL0IZkFlD5+rVzp9?=
 =?us-ascii?Q?q8EzrRDHEnmvn0wzUGs8SfMb41NwrsqOwctg2us3TAZK876tn3ZRreYznyZP?=
 =?us-ascii?Q?SfLGytVnOlzAYMdlBcz4KB7BcxzdlnM7l3Qd22n17Z6WYYeqa5U3ckmbkZwF?=
 =?us-ascii?Q?q384Q6jMDU8LC94rqC0T9swW/3+YpkcmlFMQl8aNZL1ZfJPJAjf0AJTCCk57?=
 =?us-ascii?Q?jhdgolWALujjx5L+y/NUXHIhru6O6GdgwWLatcaXWiXJlSviPYdv4cOhp9H/?=
 =?us-ascii?Q?qDFMRbhn/8PNAfHZULzroEemA1N1nNCdGoTymWxSaduHv1TY4NZhBo/3IMaM?=
 =?us-ascii?Q?xiZeSktZLczYew1SlNOgz5rKIkSi6iSqE9RMY8iMCqNR0RIc8Ke7g+VfzGGX?=
 =?us-ascii?Q?J2Q8GRfVpJONoeTFpUkutmrGtmCvhUFqsSAYZeEuq1yOCrpa2dmqD/trovGc?=
 =?us-ascii?Q?lKm+tNLDxaBBAvnNA4cUkVJ+SkrA8UdIj7RfsdEDu7526qkvxMnzq8bSwmP6?=
 =?us-ascii?Q?cdOgKvEm4rA1h0Bpp1QQjK1pfMegRLXBBs2MHXziSO7g6ukjMk25+w3CfJGm?=
 =?us-ascii?Q?YIFaMTyHgKdalp/LF0nMYY0D1Qc3H9+BfrE3GarC9ohA/qVmrpRNwbK41N8P?=
 =?us-ascii?Q?3R63MKyMVC1uvgd6GyfvFz3vyefg4TiOhUr52lF9of4JsoctQR7tqb5vnsDl?=
 =?us-ascii?Q?ToqzNuaoegsIpXkIooQdm+38mqTGixleKzoQC1x/X7ca/rS4KiPhlolqHAJu?=
 =?us-ascii?Q?AstpdPDjQZhbyTwNcOjpbn1alTtH9X5cpbG/Fcv1m8Bn2sDzBanNA0m82/U3?=
 =?us-ascii?Q?jUSmHqORTBmsPPVphsH+mLtwzGhVf14CqEhC+pNnOAuo9Y2k/qKd4Goeh9BK?=
 =?us-ascii?Q?kFqrV7BZnp/0MmTosBedIZRrqm3ja1O7tgsv20BhmuDNfgd14CUo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6537ffb7-bf5a-4866-0dd9-08dec586b1ee
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:52:23.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9NBH83wD/G27lazeYoZoXu4SyetpVAbfgITN/AdTg4IrVccl+CZxb3Qm+SA9osciX0m5+uGYJnP1B5oQgbcta3ojTZfgh75T7mzZ3oXnySlMdkX6lz6m1FtwPEOojxG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_105226_926693_A44152C8 
X-CRM114-Status: GOOD (  25.89  )
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

On Mon, Jun 08, 2026 at 10:57:59AM +0300, Adrian Hunter wrote:
> Relocate i3c_master_do_daa_ext() and i3c_master_do_daa() so they appear
> after i3c_master_add_i3c_dev_locked().
>
> This ordering is required for upcoming changes where the DAA flow will
> (indirectly) rely on i3c_master_add_i3c_dev_locked() functionality.
> Reordering avoids forward dependency issues and keeps related code paths
> logically arranged.
>
> No functional change.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	None
>
>
>  drivers/i3c/master.c | 128 +++++++++++++++++++++----------------------
>  1 file changed, 64 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 57857a3351c7..5021d25b718a 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1870,70 +1870,6 @@ static void i3c_master_reg_work_fn(struct work_struct *work)
>  	i3c_bus_normaluse_unlock(&master->bus);
>  }
>
> -/**
> - * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
> - * @master: controller
> - * @rstdaa: whether to first perform Reset of Dynamic Addresses (RSTDAA)
> - *
> - * Perform Dynamic Address Assignment with optional support for System
> - * Hibernation (@rstdaa is true).
> - *
> - * After System Hibernation, Dynamic Addresses can have been reassigned at boot
> - * time to different values. A simple strategy is followed to handle that.
> - * Perform a Reset of Dynamic Addresses (RSTDAA) followed by the normal DAA
> - * procedure which has provision for reassigning addresses that differ from the
> - * previously recorded addresses.
> - *
> - * Return: a 0 in case of success, an negative error code otherwise.
> - */
> -int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
> -{
> -	int rstret = 0;
> -	int ret;
> -
> -	ret = i3c_master_rpm_get(master);
> -	if (ret)
> -		return ret;
> -
> -	i3c_bus_maintenance_lock(&master->bus);
> -
> -	if (master->shutting_down) {
> -		ret = -ENODEV;
> -	} else {
> -		if (rstdaa)
> -			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> -		ret = master->ops->do_daa(master);
> -	}
> -
> -	i3c_bus_maintenance_unlock(&master->bus);
> -
> -	if (ret)
> -		goto out;
> -
> -	queue_work(master->wq, &master->reg_work);
> -out:
> -	i3c_master_rpm_put(master);
> -
> -	return rstret ?: ret;
> -}
> -EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
> -
> -/**
> - * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
> - * @master: master doing the DAA
> - *
> - * This function instantiates I3C device objects and adds them to the
> - * I3C device list. All device information is automatically retrieved using
> - * standard CCC commands.
> - *
> - * Return: a 0 in case of success, an negative error code otherwise.
> - */
> -int i3c_master_do_daa(struct i3c_master_controller *master)
> -{
> -	return i3c_master_do_daa_ext(master, false);
> -}
> -EXPORT_SYMBOL_GPL(i3c_master_do_daa);
> -
>  /**
>   * i3c_master_dma_map_single() - Map buffer for single DMA transfer
>   * @dev: device object of a device doing DMA
> @@ -2476,6 +2412,70 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>
> +/**
> + * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
> + * @master: controller
> + * @rstdaa: whether to first perform Reset of Dynamic Addresses (RSTDAA)
> + *
> + * Perform Dynamic Address Assignment with optional support for System
> + * Hibernation (@rstdaa is true).
> + *
> + * After System Hibernation, Dynamic Addresses can have been reassigned at boot
> + * time to different values. A simple strategy is followed to handle that.
> + * Perform a Reset of Dynamic Addresses (RSTDAA) followed by the normal DAA
> + * procedure which has provision for reassigning addresses that differ from the
> + * previously recorded addresses.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
> +{
> +	int rstret = 0;
> +	int ret;
> +
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +
> +	if (master->shutting_down) {
> +		ret = -ENODEV;
> +	} else {
> +		if (rstdaa)
> +			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +		ret = master->ops->do_daa(master);
> +	}
> +
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	if (ret)
> +		goto out;
> +
> +	queue_work(master->wq, &master->reg_work);
> +out:
> +	i3c_master_rpm_put(master);
> +
> +	return rstret ?: ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
> +
> +/**
> + * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
> + * @master: master doing the DAA
> + *
> + * This function instantiates I3C device objects and adds them to the
> + * I3C device list. All device information is automatically retrieved using
> + * standard CCC commands.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_do_daa(struct i3c_master_controller *master)
> +{
> +	return i3c_master_do_daa_ext(master, false);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_do_daa);
> +
>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
>
>  static int
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
