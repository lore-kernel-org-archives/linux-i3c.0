Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF26ED39426
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzjFFiJxgJdQQIUoAcp/aErY2rwAsD5jKdsP35xbLB8=; b=kL7PBiYdvYg+Re
	8UJna+OyKV/F2AH3TuHWBevbkQb56klbwXJ1XIN4vREQiUOA+ZV+tXNySdiDwQTGJvQ4bSfJ2zcG4
	3d/cIVgk3wccXgey2lh/WP6U23D7tRLw9SczacLf/8P1xboMtzjif2TByekGpGRm6f7UH2Pu4Nys/
	UMp7kBS1NCFUYMFY02Ls0VV2k+DxcVVbxwPT4wjI69tCKCXATCcEBx1ebbeV7uo9wZDykNC2gMb1o
	yISA+kOH9uR1FEYuGW4bF+EXlXvSaOxICscHqDhhVSf9kMKIPkjNVG6f3SO7TtdpW4gTLMF1wlfyM
	uSNosq/8PoyOk3n1KQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IL9-00000000Cuy-2P8H;
	Thu, 02 Apr 2026 13:44:07 +0000
Received: from mail-westeuropeazon11010026.outbound.protection.outlook.com ([52.101.69.26] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IL7-00000000CuT-1O5s
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 13:44:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4Qd5t5IwAg+W5SivtZqEEctSXYgz8KddT9yRfh61t6zXGKrO13kkQkMqrh/S93JFMf3vXiDObzZzPDZACDCOdSNWwTkullWSn+jVNDdWe3uTZz+xkfDdaccTJbkVLYAiIVb4JJ9DDUjoMvUnntLurCigSlQiJJe2ZW/1HF9TImv8Ls16hfhtuhB7ncuRG6KqCAbN9gFsoUfTzEArttw6a2jKNy1h7yyVh52JYVH+oCYUCDVVhwCAZLRw5C3zGZc06YHdBXvYL0dkDPv3rCfirLJItD7ktDuPCPsV2ymAhDc+bJAXWbBj2kmjyK/1m0/WyuXr/EdSLUUY3qOJUl64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzCHM7kIvwk44DPl1q9KMUBPa7sL4W0/1ThOq9AZVxc=;
 b=RqQzUkmvmJ1O27bhm5or5mi4fMjeLi9F7bnNqe3Kmm8FHnd7/h4K4kZJR+c8fEP6WvLD90XiReXTcgu5UQO5xmoM1fdEa1ahpV46KsdMM9WaqxaFTcMH+XsRpY8Q/FTL9L0lIZl8aAycrzxdNX5Df74M6jH19SyGHQJvjdm4lYp/vvLkBp3CV4GsH4uXsUQbqI9m8FOwXz7jskQ0zSkOzR+tEcMkHezA3QeHrxZOIdiQcFg/9Zjgdb4scSuBmyPNuwGmtszsi4P0itAP5aLn6//zlelqT+Y1ghTJxCmNdj960pXp50nA64Obl8oc/ikyrFYVDUs8t82LuTAd49nssA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzCHM7kIvwk44DPl1q9KMUBPa7sL4W0/1ThOq9AZVxc=;
 b=L4WtFw16FD8x2pbPIB33vyjH2Ajur2zEpWjsneaMpoKy/4lB/Dx7fLeay76PvDYfd9U3baT39iHbBKNn+1XR//LK53JhNJ4e64PAheDt629Wke4uEFGL62c8NMsulGLEzkH/9CUWwWay5osW30zKzguf03OGfw3lpD/xqW5lRs3ty7+ssyMvvFCZJYAGl6QF8b9LCxKRruf8DjGVqfXTQFJf69bo2f0MMgOQmBX/rHwDPj1b+gUDWHFKmnIYKr9vHfA5xHZUFpqNN08yZuHi3BgLMVOAvEv7F3p7Fieg9ZOVT0wXAx63xisXBJzKbgSzv1DNqR1zCZ78ir9IOmo8lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 13:44:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 13:44:00 +0000
Date: Thu, 2 Apr 2026 09:43:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: Fix memory leak in dw_i3c_master_i3c_xfers()
Message-ID: <ac5ymi53ycXZOr5T@lizhi-Precision-Tower-5810>
References: <20260402-dw-i3c-2-v1-1-b530970654ec@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260402-dw-i3c-2-v1-1-b530970654ec@gmail.com>
X-ClientProxiedBy: PH7PR17CA0050.namprd17.prod.outlook.com
 (2603:10b6:510:325::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 402ec738-a7ad-49ed-e995-08de90bde577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: eoHxlOSUUdCyn/KoaEzKrExOPfwbUizH5IZywHZAloNpe1P10DhTUVo/7VyECvDhLA3F3zl+8CvvWHJ/joTvp2Pho3V4cH3n8BdMSbK3UNb0x0buAvDiwIfcxv0e1dt/eOrN88RKEEtKodBkUfA3TJk+XIZ4cfSSIv6Nogjwa99n0NrPafHoMRbG3Z+i4gd4M7zde9sPPoZBM0mY6UBZjst6k+Om/sJykQ6UvP/1umfX/KcnKPuaFIt1FtnVrf86+JYML2KeqjaPdEOUxO2U1pzRt/p+gDaOgVIQ2jAgN8897e3D4rxGR2rp/aIceYGmxEzsueNN8/plQq6UzvwteRspsNwY8WlmEEq266gYOLwVqPdM3c58CvXJAHMhKKQTGeNrnpIWaQEFS49SVYpl4IEuQ7IOvv9HuwtMjamMRJqXX7NZax/vijQ5aVc+932cJoJZeAzl4fYYQ3ZaKy7v9GNdmnulq0WP8HMkX5SkD6Le+BzwFUH9/soso4T2kOlOEkm2iV89aZYKbYXoHpRH3/FeUqOIAnail3pWVco7iMOiEktgs9mXWNdZrfCIG+fYr5mMcCtqVl/8mrBMppt6FEIQx975I1dnJ8QAlBXR3X88/Janm3EtgxvN+IYOBsXJUsbDfXkDvTDmPPaNqD68GhOmbVZRAPhjy0OTcAX6VUA2w2j1gYyNdNCK8FSvZmTMhnhnPU5mTcFqWAuTfeUSDYOVHyb7t1GgcSmNWVLL3yzJ560JT71IzHjNUoycDMuczUTsFInk2+yDBw3L5pxgH2tboPujVd3MU6WNHL1bcuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nJC71oypKhg0hr8S7q5ApZTDwowdJ/8xhXvUTTA1y1C6RmYyxHmjqf3xzWp8?=
 =?us-ascii?Q?eq+/remhqLtYdy918hpFUEUYQw1ktmSqyqqTf6at1ucKU7LNX+h1N5OStTaY?=
 =?us-ascii?Q?vBxkndnAAcaeFrDc330lpxsXg+9sI/0sIDXgHHGS31Qbs1o37iNuWGeHUuuK?=
 =?us-ascii?Q?9TrGVKr8uC5Ci1Ex4Xgg1N7LresmKeKGZOeRth9JzsSGh+QlDdUb6QDJomx0?=
 =?us-ascii?Q?QadyiEpyaJmwiJcyLwC3PQv5Wk1Iz2PKPBO6OPfm+/OEYhzSRs7o5uJ/ZgNw?=
 =?us-ascii?Q?QM1jFVckni8nSYEA+BIGq9rPlc3WwuRjtf0lRavSw5J2p2mBzHXtvT3+hia1?=
 =?us-ascii?Q?8z29p5Ch7pEdXRidWHADCvkWuV0/p6ZC7dD4uNx9Zs00zMxkde7Vm3ssGW7i?=
 =?us-ascii?Q?vrZkbac+rprrnGwjQ6Syl9DPCVOutpXl1rMg+ik4M+kUEaP33j8IVbl2l8ql?=
 =?us-ascii?Q?473JxAaeaunfUlhUV2ZPmYGJtqJQvgNI18ngtsq0yJBqsQ/KZAWRAN/GAuXI?=
 =?us-ascii?Q?XimHHNFy0NA1zkY9p/mSp1TRP1k/USNFYdkaRqeV+5u7wK7OJ7jY2nnYyc6P?=
 =?us-ascii?Q?6kQNG0UiU3Rgvbf2sew5oHwlFUmZVm066DZkcyd78zrSeYf+VX1b8RRWgAdq?=
 =?us-ascii?Q?opTDygsJk/eMqfBKhpgEy24H6f/pmFYYbG3sfpsw9LBL/CjpNuAIVfnwrTuc?=
 =?us-ascii?Q?/uNHbNLrgVV65sVzzNbmS83mMS8IpnpfrSazJc1/c5TtJ/IPvoayHSsTo63A?=
 =?us-ascii?Q?IKUcu0ucsWpgWDy7Z04NWbIPyHI6qo+qVj4RiZ1QjdKKnne0IZHWSQzYqOea?=
 =?us-ascii?Q?XBtwfovtzCiB4DJpxSWiRACaN/7mrg2j3+87hVDWAw+5qJAOGFqMVEP/7Bsm?=
 =?us-ascii?Q?ofzfLdj9OiazVGiegy0/ClRs4x8a47Go8h4z3RFWtu5WSN/cxkPPT3IFtqP3?=
 =?us-ascii?Q?JmKqwAeYcQnTEXOxlzPQG7sDrOkm6vO4dNUcfX01Iax10Xw85G0pvnPSCDvB?=
 =?us-ascii?Q?/qs76cLhgbAHDYsvoNskLS7r88D8tpmEBJ2dLeWXcGdim+al8PNWY8aCLRc4?=
 =?us-ascii?Q?sx4HCJog2g80Fclia0pHlL3c+To6Hd5TwVm6g3BL9//EJ5PuZx9L0GREuCUI?=
 =?us-ascii?Q?+3XkP27PPorqUPIaQ0KlZUUt7UiBVhwogut+rE6Y1iX9uptasatCUbkLbhvz?=
 =?us-ascii?Q?AWq2H1aZzsd9ePepozeyTGAPM/eeL+nVD+fsmfRVm8yhXzvLWOSCl9igkYw7?=
 =?us-ascii?Q?8IFK0oa7f8N9JKXy+hCU7rboUfu3jjgUpW5JR+kZv4L8ZqJyPphBzTOXjLUp?=
 =?us-ascii?Q?UWRphRZZQg1FcugKCRq/jo79frc0OS5FTv3TGWFvxgqBCInQiDe5xTk0izsN?=
 =?us-ascii?Q?BK5uw1SQRhlNsDnCWU0oP2CLLkAR1znTyEJ3V6da/rfanjBH89ObF478tv+U?=
 =?us-ascii?Q?3e9bUpGj4RAZmiTvwp0JNNJahU8TIAli2rHIK/WWYoUjonYPPCT8lCez4Aup?=
 =?us-ascii?Q?elB/FR4i8z/EEbLYukGhJ7ArBAkrU8sdb1XBQXaHZSpz7DTVRTaOVS/01OKl?=
 =?us-ascii?Q?LgoHWsXcUhn1hQPIixm3qnxYwvHWD8QKXclSEcNGNCU9kXAlKYCd0KQRvKiF?=
 =?us-ascii?Q?rXoWV6xnMr733GqS1jm4Jl2aPaIEysTG/rLVBu93MQrCh0uLwdTBxmE/vKxV?=
 =?us-ascii?Q?IuNsjEpfo4IeTdYpc7WILw0cMxlMmY0o5+zvC6lqgy0YGjNtxYNNJ11jT91Z?=
 =?us-ascii?Q?GAmieXgyqQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402ec738-a7ad-49ed-e995-08de90bde577
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:44:00.8995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a79HjpUQXFwVeprHXCv+gGJLA2wmwUdQuRl91vkfEGBnqz9Yc3UC+NLz6gWrsLti4dOL/8om2d5L0WAekY5hZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_064405_821431_B858EB1F 
X-CRM114-Status: GOOD (  19.42  )
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

On Thu, Apr 02, 2026 at 08:38:03PM +0800, Felix Gu wrote:
> The dw_i3c_master_i3c_xfers() function allocates memory for the xfer
> structure using dw_i3c_master_alloc_xfer(). If pm_runtime_resume_and_get()
> fails, the function returns without freeing the allocated xfer, resulting
> in a memory leak.
>
> Add a dw_i3c_master_free_xfer() call to the error path to ensure the
> allocated memory is properly freed.
>
> Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d6bdb32397fb..d933db076c61 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -953,6 +953,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  		dev_err(master->dev,
>  			"<%s> cannot resume i3c bus master, err: %d\n",
>  			__func__, ret);
> +		dw_i3c_master_free_xfer(xfer);

Suggest use auto clean up to fix this problem.


struct .... * __free(dw_i3c_master_free_xfer) xfer = dw_i3c_master_alloc_xfer(master, i3c_nxfers);


Frank

>  		return ret;
>  	}
>
>
> ---
> base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
> change-id: 20260402-dw-i3c-2-8f123def99b2
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
