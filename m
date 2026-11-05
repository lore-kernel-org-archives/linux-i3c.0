Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9711A606A326
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Nov 2026 22:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2NGhI9Wy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oDUgjth2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4OHLdrbd/3CVA0kt/SSYI7TahnNUOOObTVA03GIMmPE=; b=2NGhI9WyuJcjzfroyZMZ+wifDj
	Kr2PCQV/GbmIGc1WT+Rkd1HxE9k0xxJ3FlSsAjObDHewhW1Ptudl+vfinfh+l25DBQkf/HGpthbVM
	dLs9w0Y8g75dSmGSCV0SMHM0JvZd9IG9GI7JMB2gB/KzNH849KX76SWg6D30uaH0fj+aMuidWNess
	VoZaqMc8Ifvb2YTg2OiMuS1GQ1ArCnBgrCO98jWDxMWXq/9JiyQAhYU6F3L6v2nfwviUewKlbBm6w
	5YCP4Z+VYHqCmtkSU+M7h2C74kUMnkfDHbPnyXuSDBQ9Iw2vPoF4pkRMh7kCVJ0vLRu4gUUDBVm7L
	N5dBgeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5fp-0000000Amcx-16RL;
	Thu, 05 Nov 2026 22:11:09 +0000
Received: from mail-francecentralazon11013025.outbound.protection.outlook.com ([40.107.162.25] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5fm-0000000AmcY-3v1J
	for linux-i3c@lists.infradead.org;
	Thu, 05 Nov 2026 22:11:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaL1z7lFvnP3lmSiCk0aGuQbZN0eATkpiumpBmKKQLw/cJA5IZRq0P5dH63M3ZJsyuAI1pC03hN8bFPqDuwnSlIyoEy/Ypi/l/P+tVjbCc7fReIdwuJNEYZtufg3YgXyCxOV4XZx3aDqu8Ym8+TalNnK9iE5O0rmMJtX7+f/MKUcth3rWjjIO6k9R8mvABaP+hppNOmGc7QAGsLyeEvtmExxq+d+O8QC4S11k4PDhPlZx+qvS3wC/yjs0CLz3AfXhGHBbHxGgVEFwsMeibYfVru9vWWmQoLJYx9/BG4WIb1HplGIJWHrjdd+Cd307xoUcW0xLt+NXRer8KSVrsAV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MTBEjDPVfkCoAaj+iEh3c7S4M6Np5HboSMttSz04VU=;
 b=b+zSYjnEj0It5l6xN+/GdEc/XYsIIIwjxAhVSzVbHR9VWfwQRzfPSVi/DuJB1iEKSBcnZxxf0s54Shyk6B7JT1S2OUfUKicLUzdrBZlpMezQMuAxIftaK7FkS9IuGpwQIycJXewCPC/B4DaMPDp0S+AMbj3WC+NqQ0ahkBQZNnWeqfNqdgKanc0mLEpgxR2hYpYXxk6W/Yc8yf1SlsUpqqlaZWReYbayH7YvEKsacSxhO8GUTfrlDLn+wvZVjkcsXKbVp+ccii+jhc6BftMPvvBtWIlrTJ7uUC5dsesK6ijJ+V/s17Qt319y/LGTn0JUAwOJv/2/cfQUtx6Xte92hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MTBEjDPVfkCoAaj+iEh3c7S4M6Np5HboSMttSz04VU=;
 b=oDUgjth2UG5SX8L/NbJAmQAJS3+Nv4+X99Z8i9z9OYK/FiNlXenh2FUc6uB98BADdT0+oMR2T+PP4TARLVcnuGpWuutrjR9J66blFiDLhhrw3HoCuKKrDIOspUlRp6D728YP6F6+rk1yq53LxpLKYJV0cm9DyReZbLGkWrkIS0JsnnEpnO9uPavOIdldfJz9w/1HlVvcOHcJNzMBCIt8GPA2PN4YQW9+9wsXvvWa+u86z7TBvM7E0/oameasUiZZY9Oq5I6XseOMig+yBVxlqVirYx8Nd4ByyqakHRpY2LXrlAjmyCrgGNcCTOzuc8Agsn1/9duOpYlm3LOH3SM6QA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8541.eurprd04.prod.outlook.com (2603:10a6:102:214::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 22:11:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 22:11:02 +0000
Date: Thu, 5 Nov 2026 17:10:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	meaganlloyd@linux.microsoft.com, git@amd.com
Subject: Re: [PATCH v2 3/3] mctp i3c: Clamp transfer lengths to the
 controller limits
Message-ID: <auz-7yXIAj1BFH5F@lizhi-Precision-Tower-5810>
References: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
 <20261105085425.3418230-4-shubhamsanjay.patil@amd.com>
Content-Disposition: inline
In-Reply-To: <20261105085425.3418230-4-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: DS7PR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:8:54::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 106bee28-35d5-4a75-562a-08df3b89ad8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|19092799006|261021123027099003|261022105027099003|5023799004|11063799006|56012099006|4143699003|261028144727099003|261009223027099003|261021121427099003|261026121527099003|261026140227099003|261022075727099003|261022113327099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Jb9h8jo0QWVzPY9wP6EBoxPRnAu60I848Gxdchw76MJWYES19ayPndlX9UOklD+wse1H6b9iIsXBYw7KaR10ozv/83M0RSD1xMUngcFVjZa3+VGXBCtDdixeAbYgy1wcL6kzfLN2LIoy1uvt1RNxabvwIUt3dpBdFMXg+DoPEIoOdwC6+QLb3bZE1iEVU0WOWBDNvXmpU0vC9pt0ikUIAy2/qwmu9t3vYZ0DQpLQ7F19l6llx9i6p1lf+d97S92g6Hlercmk+QZLJkgMJZ30kiJfPIY2KxPqWQkmNlUmtMjqFIBfltDOnDvOUaS2TLN7QF/k8k9baMJABGP9GfrKPzez1d1qfCN/+nupfqk7kVxHwqoJJlq/9NUj6u5hkw5O2znoMsLmLv3RKuES0DLwM8Jy2YrzR7WM517UHOq1QgJz7bcouWMr5eHJvm7zIPCDbGpDBmzH/d4AZSvt9qbQguUyGuta5iPzG9Vy/6jFRNTZn1KuFAH08822CCIF3a/Wyw3UIIeeawHGeyAaq9JFP8ySeefvd8S1HpINCMfSt2YC4bfUCW2kqe0RYIVah4ufEDKtXPSbmdK7QloPlm1eM/WumI/8ub2wzYkRDlMalZs7L2DG3MnBzSLL9w1vjjBRCaRauXDTwkCM4p1J6TFtEUSS96vGpS62lFRi09muxjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(19092799006)(261021123027099003)(261022105027099003)(5023799004)(11063799006)(56012099006)(4143699003)(261028144727099003)(261009223027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022113327099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CoOqj50GGcEsaJSi6hwt4Ojp204MEYQKZlMfukdDRU+Cwp7P+JNZXtwLUkHR?=
 =?us-ascii?Q?vz825x6dP0OIYyvn1v9ogV4L5gsAcp0hxs5V+M7Wj9jfCXtLtWXR660sJb/w?=
 =?us-ascii?Q?HLYQEB+5K7ph4RTfUx0It/ZxjLOZSnFkjDczRIlN7yHNPktRceWh6NywpXB/?=
 =?us-ascii?Q?fL11En6tOAjpyD1LxCuwYjrIFGqQHpQVBdIAAsC56hVG2NzJ05f4wwcF+/8w?=
 =?us-ascii?Q?P77a3Q4jiIUVHStRrP8TQKYTEFd1hoK2egPiZacVIatpGdGMCTNAWN17LOEU?=
 =?us-ascii?Q?N/GY0+5Zc7itCToa/dRUinqqRilT9rT+TZkHl6jcNuMJ86xbPGBwapsUI4jv?=
 =?us-ascii?Q?91fpXkoO21arNQTs/o1WE0f+8d6ZoywYOIjGNoQji4mhlGcuLUaPS9rPmv/G?=
 =?us-ascii?Q?b8s7MoRzGFvJFxyXAGu1BlbeDg5OV4hKvf573VuVwOsBLwIgHTNgUEG8jagh?=
 =?us-ascii?Q?gbquQNim8u87zB4rIswiebZhf0dWj9h4QkA569e+LBJM8GF1RrICv1LRALHq?=
 =?us-ascii?Q?j84jElNLDGskDrcwqtyFZQwrL/rPQmMMzkNIaWaV+ZiTDdtYFlPFVobYmJjV?=
 =?us-ascii?Q?RacafzjMFj5vgKfVjQ1KScK175H/4bWtbwsZtzT3D51LJgRkWyLSf+BnG6Ae?=
 =?us-ascii?Q?Sux0Ek/7ycNDaL4msQV6/C6PXCVyqPsFfvWrOR8LTHHQZPNZlR8Za+PONqHa?=
 =?us-ascii?Q?kQrfXSsFP6OG24WJc695wc07WBOZBnhdfJ6pjB0Ssb6LoXhL5TJAhsECJ/U/?=
 =?us-ascii?Q?e1tVngeeoC5xDXAkjOMmzXqhwWoBh32x6ciTOm9gMJL9SrrAjMAgwch/tzxQ?=
 =?us-ascii?Q?avKsVFBzinijQhhDraDhgE8ni7JyVnqzzyHnhFeKYE3q5ueYUAzEs16CG09h?=
 =?us-ascii?Q?1SDABPTWi7ANNSGhLDPmPku+pntceamc3Bcamt57CBvsrdeLpyudvFXZR9t/?=
 =?us-ascii?Q?vCv2n9ogbSYEf2Uij97/S+UKKUpQqxx2Fxr1EsEEssy1kMkJr6VTtI8O14vJ?=
 =?us-ascii?Q?vkaTKkeH6jbE0By1C+wLRA/wjFSaa6ueWv60IGbNRd50hIakikn7Js94kv9a?=
 =?us-ascii?Q?wZC4rpiQtzqS5A5HrpZbAXkOl17+FDqzsDE8U5izJ88kBafHwC5OpaDSg5/P?=
 =?us-ascii?Q?qrHp1sgt9klE1zuc+DhiCbkQHGMvF/4zaMYRhGdSR4v7tkvduMYMtAms6CIf?=
 =?us-ascii?Q?3MydrShPxipKPB0+J3ukiUxDsSX9TfakNO0LtulbeTPBhNdBT3B8uERFbYck?=
 =?us-ascii?Q?bJLy13c1MOah4Z9wquMyU5a7OulHD+9Gm2T+nNm7Zsh8NQWKwGi3g8IvVwLe?=
 =?us-ascii?Q?eQwk0bCJXSK5Kkx1dVdqXupzbiE6KLWGD1Mr+1RKUFC1qrf42I5oVnxnbNYh?=
 =?us-ascii?Q?wFjJpIXqFFDVr5JiyMPrl3pFvLqNmiEGFU4G+6Km54Cy8q/sF8rGuVtVnBxr?=
 =?us-ascii?Q?Q/kImfzDSCM4Hs4qKtE2owqrynDFW6zVOZHL4/1B00E0HTPamST44iozMDYP?=
 =?us-ascii?Q?OCo9yl++CzfdLDfFKnpSOT60FN8gV6VkutCtZ1U+izVyqBcsCx9CS+k94H8k?=
 =?us-ascii?Q?bJZ+Avh2+MrzRjZfp4YPspnE7EL9HWKsenQx2jXTjcFKOl8SV6bpS7EVl7Kx?=
 =?us-ascii?Q?blbrCpEPND9dlKoOgm1CGEVS72YpgVZY8X5oxJtVDDPcYfmx7aPl4RQ01OTi?=
 =?us-ascii?Q?B66nhYkWAop8BXiBQoBEeoPQ+3eaKKlGnYcoDUr8Mi04//c8S9iGdx2hiC9C?=
 =?us-ascii?Q?9x9VBJOBb+E0BpjrJVLafULhQlR9TCYE8zHc8CfM9bbX0bm/25Z2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106bee28-35d5-4a75-562a-08df3b89ad8a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 22:11:01.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHbTTWOs3n7QoTuHlzPyz140w5KtaixfWYTHWNxoKIzPJ8iz2663w/B0TLAk7XjRLFxveBiCDNx2VHJX7O1UM1nI64OHIAtu98nDsjzmeU0AY5a4ws2LfeTp4K4rNxuj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_141106_996387_12B0BB99 
X-CRM114-Status: GOOD (  19.71  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 02:24:25PM +0530, Shubham Patil wrote:
> mctp_i3c_setup() takes the maximum read and write lengths straight from
> GETMRL and GETMWL. Those describe the endpoint alone, so on a controller
> with a smaller limit every read can be built too large and rejected.
> Transmit packets can similarly reach the controller even when they are
> larger than its transmit buffer. The receive path also allocates an skb
> for data the hardware can never deliver.
>
> Use i3c_device_get_max_read_xfer_bytes() and
> i3c_device_get_max_write_xfer_bytes() instead, which return the smaller
> of the endpoint and controller limits.
>
> Behaviour is unchanged when neither reports a limit, as the helpers
> return 0 exactly as the GETMRL and GETMWL fields do today.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/net/mctp/mctp-i3c.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
> index 88d9e36cd4a2..6d08898e1d21 100644
> --- a/drivers/net/mctp/mctp-i3c.c
> +++ b/drivers/net/mctp/mctp-i3c.c
> @@ -81,9 +81,9 @@ struct mctp_i3c_device {
>  	bool have_mdb;
>  	/* I3C dynamic address */
>  	u8 addr;
> -	/* Maximum read length */
> +	/* Maximum read length, limited by the device MRL and the controller */
>  	u16 mrl;
> -	/* Maximum write length */
> +	/* Maximum write length, limited by the device MWL and the controller */
>  	u16 mwl;
>  	/* Provisioned ID */
>  	u64 pid;
> @@ -214,8 +214,8 @@ static int mctp_i3c_setup(struct mctp_i3c_device *mi)
>  	i3c_device_get_info(mi->i3c, &info);
>  	mi->have_mdb = info.bcr & BIT(2);
>  	mi->addr = info.dyn_addr;
> -	mi->mwl = info.max_write_len;
> -	mi->mrl = info.max_read_len;
> +	mi->mwl = i3c_device_get_max_write_xfer_bytes(mi->i3c);
> +	mi->mrl = i3c_device_get_max_read_xfer_bytes(mi->i3c);
>  	mi->pid = info.pid;
>
>  	rc = i3c_device_request_ibi(mi->i3c, &ibi);
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
