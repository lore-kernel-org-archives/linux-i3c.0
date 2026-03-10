Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37A7FD4F04
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csaZAXUJHWqT/pXzuL9v+ZaAPfWL3xbXt/NP+Ql803c=; b=2w7D2dGwmL9cv8
	3aIYn7mZDwzpQfi0zZD/AxmT+Q3QJoY6UWOlorioPi34SRo3g9tGB170IteeOQqvN/HE95+aURsPG
	ZOfICGzLpFQ4w5DogIiYpx+v48Le9dk0e1gms5EzeWTeY/iMRQ4+eAYnXqPYwsNzkZVZcG2e7DIvC
	3TLGsJKBVRk2uwZihgMa6F53FF16ocxqQxn/LQPHR87szaQbiCgCCZ2qbOJKesq8GVLDssFsrwj38
	VjGEUDmHUahmPzRnHca70b1pRL2xpbsasxBg7bDuBWomgF3ufMM4usWLKPw69uukaYtoIH+g6Y7Xv
	6hf9hEYrvoE6P0X2g6kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00E2-00000009vpC-0slV;
	Tue, 10 Mar 2026 16:46:30 +0000
Received: from mail-westeuropeazon11011014.outbound.protection.outlook.com ([52.101.70.14] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00Dy-00000009voe-3SdD
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 16:46:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNgIPsFBRSfzQbvhM9bACQiSQwb+MgiwIzcUUGGl+a2umuaSDEKEHSFiDzxpkxyK3mEWRMQz8ID/ZWMjNirTOxfiKqeTh+vyB0bwtNtKFeTjQxiJtte4Pmy+f3xfAA5Ay8pS/lpWwZ2HHxsQSp4FDUNaevj8jL4fRhEkSRPGGRNXW9LVaN3Xfd6shLsRzY8mtfpH2Ajj35+jR800b3zsezPUO5TNDqBTsJIosl3loooCD2e9L28JUjrUTbCD+11pH9HG58l9/ZjFZe5mMao3cSE9+zp7z557BOPDpoH5RaJM8Ns3bDJpZXaZe03k0EZvCbGDPtImc6mpERDJkqzYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrdPyQ4Z/bzuZaXUDmW+fIzyfi0x6w8dbDZ70iEDf9Q=;
 b=Ucuu+G22Q1eHCC1kfYVPRUTi3q7cDsAoVzs0qKtCflUHHDGgysDvPXEyutQEKVzEVOXHQ3+1cHf42BaTknhauj4Riz0gkqDsTaEnsZhNn4KdN7YxKYc/HSTMZXecLeFkP1j9Tx3sQlDZcxmogssJLY/TeXDPnl5Db0flq5RIwrZ/1KdvRhA3jh+NrZBqdU7V2FqofQid7e30E2snXwdSeSI3ioZUZo/I5M31K9ZVeo+nAWilujEz/QpxuBO0BDa+9joNDxZ1GcnoIPmkRgW0w742/t46jyOk+9B875b/vid5TV/3XJlPwo9BL53ZvY6XO8VVsoPC2x6bXVgOpI/1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrdPyQ4Z/bzuZaXUDmW+fIzyfi0x6w8dbDZ70iEDf9Q=;
 b=SBequw9JgJ+F2iMJZeEMd9wgEK5o1aVfrtQSH8VaRq4W7/iIZaD2uFhU4mY02HSXKiKAOYX5Z3nByyDHsiD8zQhQ9LMlK7iYE0u0rscdGWqSDD7jWpAq7v7MHxEtkfS8RsBGMBAOCxPo2Jo4MpEDAMdXIwS0xQ/YHdvDHiq/OqI5ueowjs6LaS4DETwfUp9DVjEZXFdbi5XZi0i9QD9bThsr6hoo9WCa9lCJDCsR2zLSLlO/IcB1/1I1kIFnIG56rsVRiDcUJH0k4sUgWDUGsnHPWj53OUrRlAC4HXxeR+BjtPEhjT4SWrF+pc1ZKDwsZQ2XUXkAzYjTo9VD2AimhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB7492.eurprd04.prod.outlook.com (2603:10a6:20b:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 16:46:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 16:46:22 +0000
Date: Tue, 10 Mar 2026 12:46:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v6 1/7] i3c: master: Expose the APIs to support I3C hub
Message-ID: <abBK1RWjGOdnB9Xy@lizhi-Precision-Tower-5810>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
X-ClientProxiedBy: PH0PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:510:5::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 06bcc1a2-6bac-4286-3455-08de7ec48f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: dygBgGgnfMPyu00kh+XpxLtoZ395LQ5AVwsesvj8ZPKB0MZh2hX0pGvj2D65jQADM4GUCmykyXUrJ2KEQqalTai5q08f12jNza4C/gtPgQ5Xs3QoQe+rituvwkhCYDhTZorGGvZxLnK4ouT/8apoPDpe6WTVLivjHLxLgmVpdgHfuOgHh2mOfRQKyaXi/eISGwbnUKp27RKVe5uu88TCyJpIdX1SIa2DyEvy2bQU8/iUFTNGRdRk0ME9x2ju3TlwQuHXBUSYaWSlJo1sE9HBcEODU4k6nrJ794926hcbBc3g5mLF+7IhTrWlpebA3OJ10ECq/HFXVXcaITbWeXF8LtGz4DaB2J+FxX4JsvMcWXB5wJnQTSk8JQDCLttKp/gl8dhQpJgzyszHlAJBWd/X4H09c5AehUy71o0KIIKqMqDZyyUj0tEpUkCb6YASH/26GgkggnTpjHhzWe6oh+zboLfN8P1i/hZgyoma5YhHXHdYo+mJEnMH5xtkGe6uvSTYuB6ByZmVqPNQPa1hple+pWs64oze3AhKAZzQCrTe1WQ18CIXc5PNc0n4Z0/yPcJfhJJRNTKgXZDbDCb7r1g1bnDSiFl0T+vqP6mD+PGa40ZcwZ3I9PHIfx+UjZvokTUclwf2K9nFWJ8I7GXvsyPNJMTmUYiXERTaXawwbjeEmG7hhR/0SGnOHtEIQ66aH2HYy4dkIpnc1iq3mA9LZIdKRRPAvJT2as4W/sEmomeQZZwnz6zLWHMtVyMgR2OvNky/8Fo++GSXBcJkg7F5pNqKLBTeWiByw1peg43e3Tb7F3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nZnMbDFKtyyiGKYb+1LrlWAaWPZppFo/tUh8vADjJE+e7qr7lFhxwAn3cK47?=
 =?us-ascii?Q?4P59rSZ2V76rbeGKID0sPy0g6Mk0ZGov9pVOZQIvb743YJzgzLRMuTzjpkcr?=
 =?us-ascii?Q?ZHwVnDzb6doNAwtS6JNgyDMutgjULeVzytenKp8PdR9jb/BjIvNtXpKh7MGa?=
 =?us-ascii?Q?2zJXbXdYNJTUxrioPGU5cbz7xYtEUMWBNDwtcdVo17ej6If63QtwireNCTAm?=
 =?us-ascii?Q?rxjncHEDT/EKQTPs4UwrdfqZfh8akHNrfQxbPZwV4SxJDPOhmdiYOVYzaY4P?=
 =?us-ascii?Q?aSEyBpyVwey6CuU9t4rBLr4LtcCwTvVPIOmo3d2+iEejwiUtdFroghnfzJh+?=
 =?us-ascii?Q?YRIlEspRidntSm+gl+wfUhdkDxxIGhSps9k+LVe+njdYGHB0pOdafYeijdlb?=
 =?us-ascii?Q?15N9otJCaGS0Dldjjvty5OVXQGN1YqKjy/8fCvxRehBgaP70V73VCA1bOTf9?=
 =?us-ascii?Q?9zIuibx+VoPaFXrgb6cNIGC88jN2vyg/qa5fONGRxmqyFUgzwCRxmoUlsJYs?=
 =?us-ascii?Q?r0UluyYNiNcAfvL4soCcmptB38kKxTum41gRHvyzXF873REao+yp9rcgUha1?=
 =?us-ascii?Q?uiH4MoJlZarheJ4zIfzXATCIpWQbjKBw1RNUq7nBJRmDPrTjVuQuGq465X9o?=
 =?us-ascii?Q?B4pGm7q7oLETLFVgtvaVc2EtVf+zNLdjB6Vz60PAzDGalt06zM6c64HztFUn?=
 =?us-ascii?Q?IqnZeDG43aAhF8gm5HdSWYOkdrVBrCU9VB67/5/BvtccFH8e+eK7PfFSrYXJ?=
 =?us-ascii?Q?K7LtNUm7gbiP5assJpAEc8a86XOI0WJsdxi3OzlTP1O/x5XligVmEaYoczo1?=
 =?us-ascii?Q?1CfGf0ynyvrDw9yllMgGPc5LHdcMcGz2lgtTL4QJe7SUfA3xldE7GaMxDqci?=
 =?us-ascii?Q?JMmlcgNVypWsJx01ljae5ZIyWtsz/CgphpYmxtVkdSu28J24+m1lsxCQR7nA?=
 =?us-ascii?Q?5W27iz+FWjXAJak5tbiBLG0yFsYPI70kn/41TNQBRbSYCDi5wxGipyhPEtCI?=
 =?us-ascii?Q?ZOsdjTeRD0yIleId9inYEGW+tDZjg1WUWC2ZCrxriUWKvNDeoIEeOCa5QrzE?=
 =?us-ascii?Q?RG7CrRO8bI99I2Ru6UDJHmbLRW8TBfZyZLKYZgXXKCF32XKCNq+lr+LDzE4r?=
 =?us-ascii?Q?DEK5q4ebzs0PpbiZnANz0bJsoUAPRHY/SuV5xJlKqriJ5wXyuMJZUogizpjA?=
 =?us-ascii?Q?u0/c+m9ynVEHLXQvcXQqNXY+kBa5uwiw5k5/SfuG9GQ5Ae+nVXbCYrDU1nA6?=
 =?us-ascii?Q?fOLWPvXIWolTMXR31/RZ10xuiV4pxKBD8PJZuqfrypqo+pumeAYPQykRf0cP?=
 =?us-ascii?Q?3eaaF1JG6N7of0ZvoViVvHEuO8sZDCbzDVQ8Z2UKolUDDCZts3PKY/rrFRhU?=
 =?us-ascii?Q?6exvMX3qm+gll3tREIHR/zyVZgoCtfbOisHdLc1PHhDE1r2FuIWcb0AjCbqe?=
 =?us-ascii?Q?FiLR+QL1qPwco7UEDCF1qDe/Y/sMi44A8jOJD/wmFpwTIpywfccMJYFTXxe+?=
 =?us-ascii?Q?SC+uTEsdTR3mwKYQUHNf4bZTkoIstClvaX+o8QwSQ1ICLNeSC5wV+y5ZW8Li?=
 =?us-ascii?Q?t9EMgiqnS/MTHpfFw7GRLzjJOfRFv2NWx7kBNQ5AUKyzNFGn4bi2oAUiaoJ6?=
 =?us-ascii?Q?XjBWswzIwMrrN7O8uEZ/ZPc07aUJ/IPS+KePxngWy47auNn370yg8oxe71dX?=
 =?us-ascii?Q?bOFMQn+A6VtHDtG2lUOqpjmMHu/zMTjY1W4K7U2F8xpxA4qAeLF5ZgkfhQ2B?=
 =?us-ascii?Q?2BcSEtha/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bcc1a2-6bac-4286-3455-08de7ec48f48
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 16:46:22.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqxpu6krmCsFuHQpHpVItuFEUOHroIt4Zxzwv8Lp8CKdjBYvjd8oSC9DGHqfLvW7Bp9EuFZPDtgnQ14M9hSgJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_094626_877425_D5FC24E7 
X-CRM114-Status: GOOD (  30.85  )
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

On Tue, Mar 10, 2026 at 12:27:21PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Expose the below APIs to support I3C hub.
>
> 1) i3c_dev_enable_ibi_locked()
> 2) i3c_dev_disable_ibi_locked()
> 3) i3c_dev_request_ibi_locked()
> 4) i3c_dev_free_ibi_locked()
> 5) i3c_master_reattach_i3c_dev()
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> ---
> Changes in v6:
>  - Split the patch into two parts:
>         1) expose the existing API
>         2) add new APIs.
>
> Changes in v5:
>  - No change
>
> Changes in v4:
>  - Updated I3C master to handle hub support
> ---
> ---
>  drivers/i3c/master.c       | 70 ++++++++++++++++++++++++++++++++++++--
>  include/linux/i3c/master.h |  2 ++
>  2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9e6be49bebb2..886637757c26 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1619,8 +1619,23 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
>  	return 0;
>  }
>
> -static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> -				       u8 old_dyn_addr)
> +/**
> + * i3c_master_reattach_i3c_dev() - reattach an I3C device with a new address
> + * @dev: I3C device descriptor to reattach
> + * @old_dyn_addr: previous dynamic address of the device
> + *
> + * This function reattaches an existing I3C device to the bus when its dynamic
> + * address has changed. It updates the bus address slot status accordingly:
> + * - Marks the new dynamic address as occupied by an I3C device.
> + * - Frees the old dynamic address slot if applicable.
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: 0 on success, or a negative error code if reattachment fails
> + *         (e.g. -EBUSY if the new address slot is not free).
> + */
> +int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> +				u8 old_dyn_addr)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
>  	int ret;
> @@ -1644,6 +1659,7 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev);
>
>  static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>  {
> @@ -3168,6 +3184,16 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
>  	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
>  }
>
> +/**
> + * i3c_dev_disable_ibi() - Disable IBIs coming from a specific device
> + * @dev: device on which IBIs should be disabled
> + *
> + * This function disable IBIs coming from a specific device and wait for
> + * all pending IBIs to be processed.
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + * Return: 0 in case of success, a negative error core otherwise.
> + */
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master;
> @@ -3189,7 +3215,22 @@ int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);
>
> +/**
> + * i3c_dev_enable_ibi_locked() - Enable IBIs from a specific device (lock held)
> + * @dev: device on which IBIs should be enabled
> + *
> + * This function enable IBIs coming from a specific device and wait for
> + * all pending IBIs to be processed. This should be called on a device
> + * where i3c_device_request_ibi() has succeeded.
> + *
> + * Note that IBIs from this device might be received before this function
> + * returns to its caller.
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + * Return: 0 on success, or a negative error code on failure.
> + */
>  int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> @@ -3204,7 +3245,20 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
>
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_enable_ibi_locked);
>
> +/**
> + * i3c_dev_request_ibi() - Request an IBI
> + * @dev: device for which we should enable IBIs
> + * @req: setup requested for this IBI
> + *
> + * This function is responsible for pre-allocating all resources needed to
> + * process IBIs coming from @dev. When this function returns, the IBI is not
> + * enabled until i3c_device_enable_ibi() is called.
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + * Return: 0 in case of success, a negative error core otherwise.
> + */
>  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  			       const struct i3c_ibi_setup *req)
>  {
> @@ -3243,7 +3297,18 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_request_ibi_locked);
>
> +/**
> + * i3c_dev_free_ibi() - Free all resources needed for IBI handling
> + * @dev: device on which you want to release IBI resources
> + *
> + * This function is responsible for de-allocating resources previously
> + * allocated by i3c_device_request_ibi(). It should be called after disabling
> + * IBIs with i3c_device_disable_ibi().
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + */
>  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> @@ -3274,6 +3339,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  	kfree(dev->ibi);
>  	dev->ibi = NULL;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
>
>  static int __init i3c_init(void)
>  {
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 592b646f6134..aeccec171e64 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -613,6 +613,8 @@ void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer);
>  DEFINE_FREE(i3c_master_dma_unmap_single, void *,
>  	    if (_T) i3c_master_dma_unmap_single(_T))
>
> +int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> +				u8 old_dyn_addr);

how about other functions?  such as i3c_dev_request_ibi_locked()? All
export API should in header files.

Frank

>  int i3c_master_set_info(struct i3c_master_controller *master,
>  			const struct i3c_device_info *info);
>
> --
> 2.25.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
