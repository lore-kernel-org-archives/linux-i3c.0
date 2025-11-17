Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CD7CE8D6B
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 17:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lb0b4yMfjRTxIuLzDJgA9EqCtzfIDidvbekC38IMPQg=; b=ClMXBLS3uNhmYn
	D1DXvRj7wydAOah9ZYbZNN8ds5cUcIr3WGT8goyuL4CncpbxBLPX4C4s12W1DN3iX6qy3v77W+H1r
	x9d6IV36PHLsklJADdhAj8FrpgYaFJ+/F5lHAyNX2ryls827+B8GkaczU7giBYF2MeQOJ6lkY1z4p
	smNLOz9XVyVAG3yTVByOUmWEs8OppwRU7yFaG9mwzmvcXlZP7q8jIn30ntVI90cDaKeb1etDa129X
	MGvFO9XbQHNlGbdv738mDfZq4SJspK8a2YNeSFkfYOHk5/k64MKiHQnvvqMv2sRIBKRXozxvJ5ExA
	ovUZT/OJmYXSiYjS4Ldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3R5-0000000GZcH-04Xk;
	Mon, 17 Nov 2025 17:54:43 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3R2-0000000GZbj-2zVR
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 17:54:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qe1qR/VOEDcQmQ8BS8p0gjOU6gSrgGi2PC0SmOoWPfgQuLOT9JuMPjnYK6V42Oz/dT/egCc8bnZUZSYC89+f8e+W35I86SxCaE834m/MbU4gapEeosfp531cNKhdqCmtQwKPAuifOvhjFHBtS5UDQxrOT5ITocCDEYp31QGGH/9K+/nisPg+Ew8FJivC1ypP9ZxfBUSxFznXiPcCrIChNHgBTqNXAWmM+kS/EGhWP9R8CmpgIE6ylwlA0NUpxi7QN1RW7RYVeTimZtvkCDcl4QDjPmc11MmF80pGcHeIVwz9mEz3Mfm29HXHKeIoDt3Jc8eHBl/XLxK6B8LUKFZO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjSIZWwJwUyhzkUo4AhuraOnZQZED0QODfRVVZBLB4A=;
 b=jmgwK9284ku6/1KBwiQ+oNSxg/UxMl33UeWr8mpEIBQYGRWOHp2iHQnPgF9nc/xLbIFAUKeF7tTOUF1UO0sl6+bVCQ5xwaI5WcJ6QaufgLXSxuLuMbfQ00FyGnysKk7xLaMdaba9gDgJaoTlPnEFxa2i0+dcbpBPz6LrMMWkqadFq1B9M+1XKa7de/ajOuLyybMzQ6RTvbiYAMDAGkCnQfv54n/65GwsyghytUsoXzaZB9K4rMhYgc4mkCrbxh6LT6NO/6JL83mpJSvIy/iZigjUCohIXQODs2WJLEF9eYGIQFA9LAJWoq33LLMNwsqbLMprDCYie8vvdDIvOPlZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjSIZWwJwUyhzkUo4AhuraOnZQZED0QODfRVVZBLB4A=;
 b=ND+TfYBSPKX6clgTSoh4cpvr3+U62dZzbHs1g7ZEFnEWb5fZ+9vVuhYFWVif17YdN2lVRd6jjj5Z7yfyg1hLm/yLEz42KaNS+9vBPkOikxhUKbcimSztHZnC27cQgc7rnDLuEPxRxHn0MX0JvV2sOCX45i+L9m1l/F1lI3fH1LQzfh5r2Aa28Wnyf9OBm2RrnqvjK1/dX0DkxxQ4nlGANUdu31akLdy21OSk5uu8C66Vy5CCatowuyxVN3h4dFxn7A47wIqrWG7Arz4UUAVuFsgiik6rA/QHVGvaihktXMNbrSOuhuS9zqQG2X6js2C0ZW8eDVnv8vPSpBlR+DM7rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PA1PR04MB10649.eurprd04.prod.outlook.com (2603:10a6:102:48c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 17:54:36 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 17:54:36 +0000
Date: Mon, 17 Nov 2025 12:54:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 12/13] i3c: mipi-i3c-hci-pci: Add LTR support for
 Intel controllers
Message-ID: <aRthVIuxnJHBEe/a@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-13-adrian.hunter@intel.com>
 <aReMbhYuSCT5RNnX@lizhi-Precision-Tower-5810>
 <e8d64938-9e9f-4899-bc37-dd78f02adc78@intel.com>
 <aRtGSstGcooM6mCs@lizhi-Precision-Tower-5810>
 <a5528063-176a-4646-ba0e-19d663b6ff7c@intel.com>
Content-Disposition: inline
In-Reply-To: <a5528063-176a-4646-ba0e-19d663b6ff7c@intel.com>
X-ClientProxiedBy: PH8PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:510:2da::22) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PA1PR04MB10649:EE_
X-MS-Office365-Filtering-Correlation-Id: 808705d1-d11f-4e1e-6855-08de26025f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4AVJ3MwkFjoZPAAZ912+oY2FI1QNlbecBlChIex/VuTB9ClpPvj0okFmuK8Q?=
 =?us-ascii?Q?UB8Vj+Hpz0qGwHMVpTZ7zpQhnNONrrsjqAKoLqLmKhUqZFc3ybUxn0qQ1d2k?=
 =?us-ascii?Q?ji4SNivmvpyzvhWIPXaK1WwOoErnrsmnXdaLSB/Fo20qb43TdXEH1NoxAwXz?=
 =?us-ascii?Q?35CPy56zb1fSnMEdfOnvx0QVRW4Tg+SSThWdDrARiOdbn7WyuKK/lS+JlNjX?=
 =?us-ascii?Q?HweIJwt/Q31JmLShYGFbQz8k0p5xfPi5qiW2RkbGWHhtr93oZZrFOZ9VEpQD?=
 =?us-ascii?Q?5zcbSd+KOeCUIu/w13kYuApusAYOL5u3C//AnU31Fwp/mmUTF3t9RskGu4s4?=
 =?us-ascii?Q?72jhxQ25LnnmkPmu710tAbzQr+ZYUJd452cA5gR7t5LcpeUubJ4TrnYuAEeh?=
 =?us-ascii?Q?XGDVeVoUkgeXoYwoTsJCjP5ejkvAQI8mo0KoLdEavrLfcJSTsRJmm6QllKcp?=
 =?us-ascii?Q?FxbB6bSnS/tB3H/nuCXq5oma4DuWSTcvUxbeUgf9wl4IQ6L093kIcTnE5MYc?=
 =?us-ascii?Q?LHEqsVPXxyTvSYXyviDuI/gGK7rdr+5vyMYQQQ8vn6YKSax3O2032/GhS/kD?=
 =?us-ascii?Q?lTODSdkpkrYqI0Wbc97tSf26nnki8W3fdFm/AmA3fxzuplmz3HViqlgrY0ja?=
 =?us-ascii?Q?BxxalqtXPPsCR9Wj1qAqE4VqiaGgM1KuCCoy/cy8NyOOCYV5mUDbNN/Ge97C?=
 =?us-ascii?Q?AF33ufmbZgldbM9wW+9e9DsY70EENAk8/QVWPAefpT3tHy2D9laEFsHBXTq6?=
 =?us-ascii?Q?+kqWHAk4g2DkKhsGqccDCKQbLfo5lf038CTVzADTbFYe8ZKXRSNqej0Bn4xh?=
 =?us-ascii?Q?P17BFSEW/S2D2lDRnYW8Hn690bNPXFIPGr7TRG3C7+CgDWob3o8edNdNscqS?=
 =?us-ascii?Q?58wuboVC6+orsdzfk8Wn8CItl5n6XtRp23csdorciWQGbWMonzMMnq4BE2sc?=
 =?us-ascii?Q?5PiU7iqf73FyepWWfyX4icrr1/IYKwlhoknxZn9WlCBhfMV4g0mr7aRn4j13?=
 =?us-ascii?Q?DzHsjIA5ypRmHWwHrISr7wvSWSDm3k8OVko48MWqq9F0ifgxYzEG6P/udCVc?=
 =?us-ascii?Q?tAIN0UsyXt4FOgyx7h0k0koaorxmZLNKDVq69x8b2XOkcu8G9SbR2FWQKmZd?=
 =?us-ascii?Q?Ys+OMvNs5WLqZwLwc12B538GobhjiP9dZmaTsOUnyyZAju7cgEiykbpycHzR?=
 =?us-ascii?Q?lSHawB8/9M147mR7axaR0fT1bzT2E9pxIi9S1677A7Fh+kSDad3HulXgUonU?=
 =?us-ascii?Q?mFacqhRCoPIDw+58ESFkddpbleYVhgva2zuxv83xSrtytVDCWNgBIa6A34cJ?=
 =?us-ascii?Q?qKI7ysMQEJUI4yANThbR0hiVrLACrVa9nV+jFe0WSHZvoHnoXdPeo9ZKbUYM?=
 =?us-ascii?Q?nRuvEaFDyl2brdYJIEQYGMzhqFYJjTvdh/zaxgwuCeJTOY+4ax2hSv/6A3Yu?=
 =?us-ascii?Q?v9hytWaSt3fLpHMhegTltb+dXKsdpjgxg417GCDko7ko8VvPv4EE3/pVJNUh?=
 =?us-ascii?Q?lTdwEjqNdAN2hhSB+porp1s9qedNJzFMETiB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fn9eoZZuxTMaweb114Jj51NrYIe8et7Z61l9C7zuUFDb8N2eKLlUhKgtFddg?=
 =?us-ascii?Q?BmY8heA2HnzCTU3/haaQWg4haLsSA00XznExjt6/BMqQkNSmzOkJeOTnVjfp?=
 =?us-ascii?Q?EbBhR7cMFUBSSA2e1QaFq0OtDG/saaOap7Y1i5uI4tsbvSNUWFijliA6g27m?=
 =?us-ascii?Q?1DPgbTzpFa6UO0/ySjTAA56zVUr9obHCiuvJgRxX7EVtEYdbS1g1x9wvcXOF?=
 =?us-ascii?Q?7wzeoZxuBk5PKqs+E603lWHVN1QYA5HTX9XI96HWcqmT6Gw6Rx17rgS671mC?=
 =?us-ascii?Q?JAeSgc0ofCJbtU9vGyxcO+d3+hOGSI+CeqTOmESl8KGYdlm2NYdpUbxQLqKT?=
 =?us-ascii?Q?f2glXT8mE+cd5I5D3fVnByeQYFuzbsm/H4fs7ocn67J0ueGK0W5qWBv7B7tk?=
 =?us-ascii?Q?kviieoYTHrLduILdXXfOvV/cnVC5diJihQTh3s/1zqoC6i8ybFXoCu9xg9Er?=
 =?us-ascii?Q?N3Ohh6Dh8T3UB1uLdKqT3dDIrKncYGc5rTlar2AwlUyi2z+lxJtG9coP0YG5?=
 =?us-ascii?Q?BvHKbYXQbBdCp4mMNiSzd3+YIzkUUysEjXCgPZT/KqwKcdWsAcEKmHmkp1OV?=
 =?us-ascii?Q?z7IbrZkGv+yji6zZB5f8e3Z/G8TSjR+mmmO1jxBs8jqocYSymNIBewKyl75Y?=
 =?us-ascii?Q?GYSm+eocZRIyHT9aG+Ey48r2BESeWR1jUXogcCjj43yN9D24n3JSIO26fbNZ?=
 =?us-ascii?Q?D8YgcXQQK0mjF7VVgpn8/euec+teaSVEAaqJjDSl/sUmDjkYQqdJrLHjo1gT?=
 =?us-ascii?Q?blM1hZMmrOfmK5/1JWjjktCUAVPwZl8zowgrtGTEkbXzzxvHEiHot8ovY+KN?=
 =?us-ascii?Q?iykrnHmE0SiCZctSPkHTb8rb/uh2S3eyRFxXgx+WHsDHo0n/M+r4ir6/0YGu?=
 =?us-ascii?Q?aElR0OUpvLNeloiUljmKTfDaTuSVLUq/Fxo6IFeomRklofdktHsrFq2iRWgP?=
 =?us-ascii?Q?b6k+3XaM3jojQvNKP6oD3s5wlr7KY6nGjguBwiMctvMN2J8LHev4U+ygKt4d?=
 =?us-ascii?Q?TQaKWsg+XGYL0hGawEeplonPt/Plo5pdXvDPoS1TC9LtpTWVjIlpLY2pvRHg?=
 =?us-ascii?Q?ANE7fxqLUBazrvyvZFhgispiW7OI8zMQ/iHoCG+gyVeRQdYZ0PWeTUtkZgOT?=
 =?us-ascii?Q?3xO5vw71GWPrBoy9uX3E6W/E/6F8x8igfRTe9/P4e2ZslGnkwgRlxy7GYYRh?=
 =?us-ascii?Q?s4OTNncpsupVhtXPnPYOZovmwLcvOtVCuaAN8Srz9WhzFarfKiL8FxoauQz9?=
 =?us-ascii?Q?n87s+f/gRJSfkSOu8nFqoM/+geTb8ACFQSTJdM/kVSvfmhedqqgTTcpPFx/z?=
 =?us-ascii?Q?4oVBJj8JX+CEYq+gVcsKaBCRuIiCk9T3aXiesCfe/UvUwb4ObcA1fiuqaw9c?=
 =?us-ascii?Q?+Qu6I/egj6ugOHEzcrfaAX01y57jJ31an8qg9iT6ionpS8xegGylsmT5VoAq?=
 =?us-ascii?Q?FVOJKdywqkk8vkMTGvJg2xgolbZHJrgZf0W2ake75+Hru6LILBqI4/ToZiVg?=
 =?us-ascii?Q?l4u4UDk/r7459OyFX7OIZsne6ZnJ6OMgNHDW70AGET/g+RIzeeWahBPBqj79?=
 =?us-ascii?Q?BaHsdaUnHFiGnYAoGVqhRDZCEIDXeYhFrqwdTRxZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808705d1-d11f-4e1e-6855-08de26025f2e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 17:54:36.3805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpLhindxqvN13wpurZQE3HTa3SLSZjLzfgETjye6d+kMl7f1JQiL27zakIVvUkq1T/GRJ49zODJCDmKANB6lUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_095440_777193_0565BB9A 
X-CRM114-Status: GOOD (  28.73  )
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

On Mon, Nov 17, 2025 at 07:47:05PM +0200, Adrian Hunter wrote:
> On 17/11/2025 17:59, Frank Li wrote:
> > On Mon, Nov 17, 2025 at 01:36:36PM +0200, Adrian Hunter wrote:
> >> On 14/11/2025 22:09, Frank Li wrote:
> >>> On Fri, Nov 14, 2025 at 08:13:55PM +0200, Adrian Hunter wrote:
> >>>> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
> >>>>
> >>>> Implement PM ->set_latency_tolerance() callback to set LTR register values.
> >>>> Also expose LTR register values via debugfs.
> >>>>
> >>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >>>> ---
> >>>>
> >>>>
> >>>> Changes in V2:
> >>>>
> >>>> 	Make use of FIELD_PREP()
> >>>> 	Improve handling of values that exceed the maximum
> >>>>
> >>>>
> >>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 125 ++++++++++++++++++
> >>>>  1 file changed, 125 insertions(+)
> >>>>
> >>> ...
> >>>> +static void intel_ltr_expose(struct device *dev)
> >>>> +{
> >>>> +	dev->power.set_latency_tolerance = intel_ltr_set;
> >>>> +	dev_pm_qos_expose_latency_tolerance(dev);
> >>>> +}
> >>>> +
> >>>> +static void intel_ltr_hide(struct device *dev)
> >>>> +{
> >>>> +	dev_pm_qos_hide_latency_tolerance(dev);
> >>>> +	dev->power.set_latency_tolerance = NULL;
> >>>> +}
> >>>> +
> >>>> +static struct dentry *intel_actualize_debugfs_root(bool add)
> >>>> +{
> >>>> +	static struct dentry *debugfs_root;
> >>>> +	static DEFINE_MUTEX(lock);
> >>>> +	static int ref_cnt;
> >>>> +
> >>>> +	guard(mutex)(&lock);
> >>>> +
> >>>> +	ref_cnt += add ? 1 : -1;
> >>>> +
> >>>> +	if (ref_cnt) {
> >>>> +		if (IS_ERR_OR_NULL(debugfs_root))
> >>>> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);
> >>>
> >>> I think it'd better to create common "i3c" debugfs root. So your device
> >>> use debugfs_create_dir(dev_name(&hci->pci->dev), ...) under this common
> >>> root.
> >>
> >> The debugfs files are being created for the PCI device to contain PCI
> >> LTR information.  The i3c module has nothing to do with that.
> >>
> >> Also, currently, there is no module dependency between this PCI driver
> >> and i3c, but a dependency would be necessary to coordinate the creation
> >> and deletion of an 'i3c' debugfs directory.
> >>
> >> The extra complexity can't be justified.
> >
> > Don't post new versin before we close open discussion. I see your post
> > patch before this message.
>
> Sorry, but it is late in the release cycle, and it saves time when we
> are in different time zones.
>
> >
> > So, I think not necessary to create to root, which cause complex, (need
> > lock, and refer counter).
>
> So you are OK with V3?

In v3, still create "intel_i3c" root dir, how about direct create dev
under root

	debugfs_create_dir(dev_name(&hci->pci->dev), NULL);

to reduce unneccesary complex, (like mutex lock and ref counter).

Frank

>
> >
> > Frank
> >
> >>
> >>>
> >>> ...
> >>>
> >>>> +
> >>>>  static const struct mipi_i3c_hci_pci_info intel_info = {
> >>>>  	.init = intel_i3c_init,
> >>>> +	.exit = intel_exit,
> >>>>  };
> >>>>
> >>>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>> --
> >>>> 2.51.0
> >>>>
> >>>>
> >>>> --
> >>>> linux-i3c mailing list
> >>>> linux-i3c@lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
> >>
> >>
> >> --
> >> linux-i3c mailing list
> >> linux-i3c@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
