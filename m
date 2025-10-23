Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD233CCD1BE
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Oct 2025 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVbMxOmA4YaiTXQpc7Pjo1P3NdX6MByYXMeiAOev4eo=; b=PuXARzOBE71N8C
	amceFYCNLzKr2GJDy5gFKFoymR5rwUj1UVK3pGC0HGK6B6yzDXr8jR+3YWGOM4BqtNEDshsMjH63Z
	ZEFQO8K914yW7BgmO8X+sUrDQV34B0r/IJYtAbsl1x0c4iOuZFARNh+tY2HKn9SID3jQtDdHFNX2s
	PXXvRKLexHhbTkpjgEEBzdej5oRJJFQSICETtMSns1p80GWQ94lSkM8bgL9AF5ScD2/ccfYELGv4n
	oNFgTqDBbVeGjxysRHLQUCApO40FfzFfLXV5983nR/zV/AqD9ZujUVrotcKPY2vCsfzkGvPLcCmL/
	UjKAPaAf40HY8W8RD8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBx8S-00000006kI1-2qf2;
	Thu, 23 Oct 2025 15:21:52 +0000
Received: from mail-westeuropeazon11011013.outbound.protection.outlook.com ([52.101.70.13] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBx8P-00000006kHa-3ygU
	for linux-i3c@lists.infradead.org;
	Thu, 23 Oct 2025 15:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS5qtbclBZwsfMus3H+13H8WJtya2RigQp1kZeXQeQcdHC8nZzPkIt1rYRWnvoUo5aM/hJ9Wt4C+PvCD2KcVwPScx6YCQitJN7+OxqFnUJzj41iEdtDgvwQrVcE543LK1vn7KDb5MdQyq2RvcgJZ1u22Fpn0kLHXuT8CE/mw+DWcB++VH1AdQlJFm9+i7isTgDUnHf0bNcdZN3rxYHArIxy58LkgeLkBgGQjxM7vuuP406NF5NfUSw4ZxfoKLBKpl8O3AmfmWdJn/ZICMRGOGNG64XXaDIPOLiYBiiUC0fgDuKK7k3UhC7JwXm2srxIzdCKUAHwFurMq8hGM6RI6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgSB0tozmOj67ygN7EKu2+TOKtevjPE3++JWWOe70Bk=;
 b=lzVC/wNkpYC8AiS854bwVe1q7JbQUifFBgd0qRZnxk0JYn5TT+E6ktbJKAIxltls9DcEDjjsYnzKaAIvKSgOEKVEoFicBnGxxwqE0EybYVVI/cKbX5EaJuQd8NrpBsdw2Xe2HyJcTT2GezuJISrLG7a5VAddGZ0cQnCBH/U8eA6JlpbMi3vzCu1iDzK3+5tuCH7MkfoWreqBSD7eLQsA4KV1f+VK8/yjp54X6GcSQ9aK+IzVkq5CRC7oydY7ep2B5YgXpoxM+nh7Yt8i34TUobIiqXoWqZ7/kKbRiUn2mcernWpT8AgnNBzhmLPYMg+wdgOOLJ2oVttAfY5g2BwzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgSB0tozmOj67ygN7EKu2+TOKtevjPE3++JWWOe70Bk=;
 b=mxbzU5tZPhrom17fFcl6hpjcRDMixUUYif8e8MLrDuhIa7Xw1a5snU8tUmjGlxHeo08iBaAi7sFLvSh1djBDVY4sqx8Ep+86kf/F5CJwpCRz5TRbgH5djkCF7T1a1yDghYnBA745f/LVH02HeKj35kHamRCsUgSU1qP45b/QcBd2CKTdyAOdDErTGPVQdFCyxuOfiFjpdT9UVcneczf88zl6Xz8M2g+xJ6jm+1RtnHdRenLSBlq+fjKv1bKBjyG9rjZAgtWRXdh2K8D5c/M15wWd2zsISzWJSZ31cdIEdtdiuilJF975QUciHtXfLn81ACPZaktxGjcOQqp7WvLHRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB7957.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 15:21:46 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 15:21:46 +0000
Date: Thu, 23 Oct 2025 11:21:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/5] i3c: master: svc: Replace bool rnw with union for
 HDR support
Message-ID: <aPpIAXFBRHXAVzi0@lizhi-Precision-Tower-5810>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-2-3afe49773107@nxp.com>
 <aPnmvepToKtZnAI-@smile.fi.intel.com>
Content-Disposition: inline
In-Reply-To: <aPnmvepToKtZnAI-@smile.fi.intel.com>
X-ClientProxiedBy: PH7P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::31) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e40ba14-1904-40e4-ade0-08de1247e10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SsfBxaoiqd3RvwsKZgtcL4jAAVcMd9LTaTHoMIgqHJsaPnmoNtfu5GqtBPeB?=
 =?us-ascii?Q?EfZU2Bgvd/ViyAq3HbElcASfRIqkAqj9IUrCrxh1RAm0Yst4wKF7S+kcgddA?=
 =?us-ascii?Q?Vbxz8amJ2d0OFaFjQx/mEJ3YQ2zEjSa2eVygo+Ibep1UqLYmhqUeUr5rNfCu?=
 =?us-ascii?Q?+Xa8yuhnXtbVCkC59JjlpsKIM/CgrsairdLhQHMVlgfO5zUYIhhl1w/Bg1Wc?=
 =?us-ascii?Q?Pwm9dzM0vxmEeYQ6sRNgLAECLmlnQCtS2XM3LVBVmT+9zEQbfHeilMrSBWaI?=
 =?us-ascii?Q?TfatyAPQVqiIRrg1CiCGaq40fZkCcDxM/ukjlRywMXmnRsoYTF9VzQEasJWL?=
 =?us-ascii?Q?0STordjdyW1AkCldtKR4HrSS+fr9yZRA8aQ9bXQKDv0VBUKAiq1K8Gz34uID?=
 =?us-ascii?Q?/po1hWSTtQazkMeoe3o/4g33owqhoY2Cpt5w3P8dcYPH1wEqB/x8IsuqVSyA?=
 =?us-ascii?Q?3gI+un9Bk+UTfREkqVLTt9yJ2YCEp8j3zyM7vlISGzG9WndRuCg4taInIEPT?=
 =?us-ascii?Q?vrZZhC5tABnuRt0BJ1ocCOukhCMG/fPc87ThY8qc03pZh7ofWWw+t5GjBG+2?=
 =?us-ascii?Q?f2dYFRggugl1yMy2abaVacUvD3Q/ZEHboh0PyR+Lx0gBOrHavza/Iv/dQrYx?=
 =?us-ascii?Q?S5RzmhpOv8Qg9FVTkMWB36HiCW1XHs9zH0Vvl0373D0bxlnsEc0EEmThHWDB?=
 =?us-ascii?Q?aVk3Vx2+/dyozxRww75v3iEltb8YoOS+ggo3Jjs53cMOO3IBnGfJtmND/VoS?=
 =?us-ascii?Q?ZG0IQSW+mlvZMRVps9035lA6Uyb/IghnpQHrv3ThuLoX2OVf2Fqzf6uZ6rls?=
 =?us-ascii?Q?IIfUHOCxwb8Zn5x7flWHGbu/8Kr7qKQ2QpwmrPeOdj3anAf+oKyr8WDEEPYE?=
 =?us-ascii?Q?+22DDPhJgNALRiqLC53mf9d6BGw/K0TpKWVflXNdLsx9qbX5IcFuK0wlozEK?=
 =?us-ascii?Q?HhQxJFso5oKUG0cmLZFdcfwHO84glFUtAvMiMF/X0Pr6oEQZLmCOS7Auaf9a?=
 =?us-ascii?Q?QZzXLsxfIT2jckHFgNHeoK5QM2UVS2vBM+wNjqL2pJFrfQpYrGWpnXAKjWFc?=
 =?us-ascii?Q?ue4Oz1YpUJMYj1qebluQH9TGtowgdeomPzwcQpIDXgDp62ulQ38Ibae1pReb?=
 =?us-ascii?Q?ebnZqML4V7h9LEyX2dU8HixaCpHSDltV43glp5QQZ6LF4fjJuzcAwaVdJO77?=
 =?us-ascii?Q?JNRrovpjWCYwqu6XQsp8lpQ0PmJUUCPfzV4vBAuzr3r5cBs148HYsKMq/auU?=
 =?us-ascii?Q?x4z+z6Z7rPbMl4pudJ2PL9WaT5ovEjVKLPsXCC4AOSk6IFE5p2bPsy1wLd40?=
 =?us-ascii?Q?Z6nDDWdpeNmllTZdz/ldS7bPp/M+iFFA57Di8I5sevsEZEsiJJo/Jwaw+/LV?=
 =?us-ascii?Q?yV2IL44zYUrekDlZ0lx7Tk+kr2m1xzspwPjEHd3hYWyexhDLIj1FZhOTeD7n?=
 =?us-ascii?Q?4riQslko+zerCC665MvrR3BEh3idTurPXHWZ5r+lg4+Flk4WTOmLosyrHQum?=
 =?us-ascii?Q?2jpTmvAj/wCZswt/3tbY9hNsCSUp/an7/2Tn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YvhPwoA5/Bu2F8sXfWFgzzz1BnZx327FAocZZnuIGoOF7ZiBAIp/kLKUiw0V?=
 =?us-ascii?Q?Lp5vTzACl175yrTewY6KlXEzrWwn2S9RhQU2VPBCU+47vBgTCtVdSSsenhYA?=
 =?us-ascii?Q?EAEyUDmtIL0mu0oU2oBPpZi6WDNGHfrfvEdkgHOr543FCgnhaVKvbUPMCXzp?=
 =?us-ascii?Q?ghgvGK7j5glgYMOdKm5OcWIy9aXNBR0ymMI5HlQySDPRnOWUV770kRDXjqj+?=
 =?us-ascii?Q?yCTkakB/Ydd7888RtcIU64ZGfmZQ8CK6/p0RKa3+mqzs5RukulJGy6L2nF2O?=
 =?us-ascii?Q?ATdH9/LI1Q/WwMsHe4sfnFcwtciV8Ofac9rTGt1higDeCyoWSGYyfROF29rI?=
 =?us-ascii?Q?GASz1zezRY5Vaqyw7yWohQL6FX9NATZTWNzd7Zp7SynaNvLdHamsDJ1St11f?=
 =?us-ascii?Q?j3YrXUUIc9fXoYekCx+9q8R59KiQHP1G5tgBbq+uxm9RuVS3lpmWJ7SzgZcS?=
 =?us-ascii?Q?KF8M7JYDwncudD8sA18PhZTw9Q0P/Jkk8sYyruBARiVB9NNm/pLX6woXrUjG?=
 =?us-ascii?Q?JfaVQhCVOTSyaAbC2L3MB1FU/XK423RVZLBi7ooTDwTFSbNNlnwR8VRzdLys?=
 =?us-ascii?Q?GE3E07QHTyKO/BJofae5xsPoiEZ2y2jVZSGKaL3GukE4VGPLVSI/zqLpphYi?=
 =?us-ascii?Q?drMKVTfoiK+zayucted4TzZOMUlpnGkzxBrbEh0U8tpVMXBl5usGfr1y2S5U?=
 =?us-ascii?Q?5F00ZQMVS98PynjNieqdfB/8SR4d6PCWlxL/lwtU2VFOU/Q/V+L7qAPdlYuC?=
 =?us-ascii?Q?PnAIdxHLVI4OdjWSnU3SxfeAU7JT8XllTtYZ0IBGBjxoPkbslxklt2S2FoJc?=
 =?us-ascii?Q?ru4sNrXjOx4t3aFELyR2rCCxtuNSQNpmxHu55itTb4KJTao3zBhqjsXu4CVX?=
 =?us-ascii?Q?YoW0rpVEi1gYwoNGKFNphbOYm/K+D+eQQvO4TtRB8kZNqvTQXpqo6o1Ki5Dj?=
 =?us-ascii?Q?6xBkZ230bNJ8VJDTNmcKsEEfbCfMiZlDVb0YVk98JtCzkoieZujGt1MfVO6t?=
 =?us-ascii?Q?GCqXHgxYyhO6rwbjj822g8edgUn9S2XMfGj8X5p4a0ORtn1BWk87naLkvHXa?=
 =?us-ascii?Q?ZDd88YxdahUkK0lcoOpOAMS+eNLXL79IhzynjvV6I9gzAVe9/l6UFdd++liU?=
 =?us-ascii?Q?pKUnDYvZ5BwZIqyVZmLNoI36jKz7LlaBisAcY+WbStESl878ECsz/nVozeR6?=
 =?us-ascii?Q?Sz881f+Iw4kdv3XgfIAenvJaCGsMidsDGC2myWkIupwk3nJQ3lu5xHrf+lzw?=
 =?us-ascii?Q?v/wTSlcMRpY3MlS6tTznJdYRR7zz1pt1F2g+jWMjgu+c/Ur4ScLa/1dIEosQ?=
 =?us-ascii?Q?wh1DhteTLxxXTDB0/Llt2tTaaBDsDsPaCvlFKn9HSjasRz059TzfLIaW9wvZ?=
 =?us-ascii?Q?bmjSu7l59XLYWdmoZYdxbY69Xg92uDljEoSq0mA5ScjYAmk+iJjUZnFqQTDh?=
 =?us-ascii?Q?FXqMqvIeamkTTOkJI3RGvMVNUUtLFbfuZThlDFauATwhZ/kLMVCxmGA9V/J1?=
 =?us-ascii?Q?cLng+3fn0F1/eIv6X21RFR9Odo7W067/D+6QAXcxkthDa790FVedUURG98NE?=
 =?us-ascii?Q?i3cXSYRbvpYaM19diIQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e40ba14-1904-40e4-ade0-08de1247e10e
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 15:21:46.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dN4i7Id7nCu24FQUaKrUu+DXcPAw9Wmx5ZWxducuHND9ysJpkltKDRpSPG2EyVXVNtSVJ5nez3/wM7w07BmJOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7957
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_082149_991056_CF161A80 
X-CRM114-Status: GOOD (  15.77  )
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

On Thu, Oct 23, 2025 at 11:26:37AM +0300, Andy Shevchenko wrote:
> On Tue, Oct 14, 2025 at 12:40:01PM -0400, Frank Li wrote:
> > Replace the bool rnw field with a union in preparation for adding HDR
> > support. HDR uses a cmd field instead of the rnw bit to indicate read or
> > write direction.
> >
> > Add helper function svc_cmd_is_read() to check transfer direction.
> >
> > Add a local variable 'rnw' in svc_i3c_master_priv_xfers() to avoid
> > repeatedly accessing xfers[i].rnw.
> >
> > No functional change.
>
> ...
>
> >  struct svc_i3c_cmd {
> >  	u8 addr;
> > -	bool rnw;
> > +	union {
> > +		bool rnw;
> > +		u8 cmd;
> > +		u32 rnw_cmd;
> > +	};
>
> Same Q, what is the selector?

Choose by transfer mode in callbeck i3c_xfers(..., mode).

>
> >  	u8 *in;
> >  	const void *out;
> >  	unsigned int len;
>
> >  }
>
> > +static bool svc_cmd_is_read(u32 rnw_cmd, u32 type)
> > +{
> > +	return rnw_cmd;
> > +}
>
> Useless?

Just prepare for HDR support.  HDR mode is difference method to check read
or write.

Frank
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
