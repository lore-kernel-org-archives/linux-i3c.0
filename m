Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8605606A31B
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Nov 2026 22:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f2x3zcOS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=q5hmPZFv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i9igr3TqAJWIe8+vJSoZ9WES4qkWHzTL13A4NGMm9fM=; b=f2x3zcOSfRmeZ3EMH+YGXCCp0X
	tIBXAmLcbvXAPSjalIJXAF6UU+D+07GfNQzjO3p711/VNBtW7TbgccU2IIh1WEIsmyzscoEYSoS07
	MPfclE6J77npAjM+K5QsmyukSkUtyQkcboqvLSqTY8gPis7mHZ2q0/uZphR+r++uE8q7d9w+RYiF/
	leoU8mDSl5iu0O5i/73rRuGCksmlrp1pFWgcN/chwnyyB98N5lE09EWFgX2LZaKs1e5aagrJ7ZwS4
	GhdhChhzKSshT0B2ygHxrBrAtCs8bDlM513z8CuvJv42p+WkHtWXI1F+3TF911eyni6vNryp3XHUY
	TiyUgUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5a3-0000000AmPt-2v2P;
	Thu, 05 Nov 2026 22:05:13 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5a1-0000000AmPP-2NbT
	for linux-i3c@lists.infradead.org;
	Thu, 05 Nov 2026 22:05:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSHwm3WBdYDWm7nUvYG6mNxIWXN61KDW0xklDT+fcNa4uuHCEB0qAwwc8QrOkCQdsYuY6dbDrx/KRgen9RXewOib5xvYeOet+0t2e/eBUkhR0RgpqEKNOebkR146DkM9qCJs15Q4e9/zOVG0AqTp8ca+pqvSzPxuLojbN2y/CtqQ9WxFRnFGaWhtP0mxEeq4kWgqgzX0sSX2iE/ZWrQklTMh5+cnyy9VsP5P94VXhkecUmNoKB8WBB6zJxx55CjEp+woE1HWT3Y/Dx7or1/ue+yoGS95S+1Q1Hh/YK/B7SYQDWaPAY50hk58/SqlqI2D4t96GLgc6oQw7I6+eH/ErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UM79h6/XeKWukEb9O63r2sc+IIK+Q8AyvjK8pFLS5ek=;
 b=egBKD8udShZdPSBFAMNDtyDRY2NSAbyOACvhQUuDR2jtQEj9JQs9h/bJkSGeJx0THhBoNBC75q5pHCpTHCHWXLKFuqBfh9JSCJ2oMCi3Z6Wa3rV7O70/PcBgWvmFpkaXrdEkF/dIb+lB9yWbKdmUnOgPQx8fEeqgLngz5UJdBULhrCIjy5gWUvsF7TDW+Uk78mu+WFQs+3a/gwKd1Iuj3Fcm+46fmL1EU55nI7F1z+kYsyySGNByvCdzo2QvfBmxgj0Iqp3tknIT3P/sJE8wUVJ38fBWdF1KypZ//7YSLgRJQ6vlUjZvzMmq6zaNA5vRqCMltIvEqFgsuAjgqTrp3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UM79h6/XeKWukEb9O63r2sc+IIK+Q8AyvjK8pFLS5ek=;
 b=q5hmPZFvjC335dzC3T/n/fQ04AY3NelKcVYhSrwngIWfJDowTcst2GEuRXWeyW5XKFrMiYEpWLEdZwuT1Pb9MhXwXfVNX3XiY7hVDcuM8KmSd1RAfV8mWiZwZBrOWl3x4p9nW75chlVlePM2IBQS0WfiBTEkppVG2m6Md5Cc7LZSjdBRoZ5ZOomyTqDxvd1Tl76nqhHtK6Z90uf5ud0kMsmtUmTdrE+XEEMQ8FXzidPiOK+B3Bkcrpo7RlkMrtlnbOuRnvOQ6tAWY41ct72s0osps4YdchWAyqmkVBQeMzMP6/2T9qrv2DsA/4CpmjtfcJoQokTBCtNqIc2bq3uo2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB7684.eurprd04.prod.outlook.com (2603:10a6:20b:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 22:05:00 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 22:04:59 +0000
Date: Thu, 5 Nov 2026 17:04:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	meaganlloyd@linux.microsoft.com, git@amd.com
Subject: Re: [PATCH v2 1/3] i3c: Add helpers to get the maximum transfer size
 for a device
Message-ID: <auz9hONlL4kr6qrL@lizhi-Precision-Tower-5810>
References: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
 <20261105085425.3418230-2-shubhamsanjay.patil@amd.com>
Content-Disposition: inline
In-Reply-To: <20261105085425.3418230-2-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: DS1PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:8:452::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb5e5ee-219c-41d6-458e-08df3b88d5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|10067099003|18002099003|22082099003|11063799006|56012099006|261102123227099003|4143699003|5023799004|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: 9WEBUGe1lbrKCzzRL8sa+XnKnC5kKT7ErDJT4NwlifA0p1JRRZverk1fcRTtqZzFV4Ha9OUTthP+WDJacUXWq2hPDuYzbgWOCQuc5C9xcueK8UNU0xUvYTD6imvayQjJuvccKvuqjaTUIqjpFNhCP7UdELITPfx11p3ZGysGOSJB+KaPP7Phxgolbbwdi+QGIRT6wvNtTyLLXY3CJi4dL++9ssccvvAgJ+V1L0FKFpLEt1F2fbC0nDgLwGMU4jGecOAFUJ+lnYpqxw9SHu4e5J8wDiDFDl+rMR2ywD5LHTEbpur45Ax+XhUV9OkgTWUPpOILDuW7aPzFTotkHP14Lo3SPVAMLRJHrZfKQ02sOs9wWlYPxehNBHBnRQMIHNwKsObKhQoJjkte3V0qrUS4oK3OGAXxSEe6oHZ4PoycE3TdKyQOTbvmJ5jv+5olKHnfralJaICxlct7DLlgJhHwL5/XbF9pa+RfzB836BAyeIFsgvCDHrZwyJhWBycFaVV6bcsbgV1C0LVBUOOoCDEIpD2MDD4TxVyBWw+uqkhcVvNaLb78G4AWeqoLNI0sJPwfO4zwgTkV2q3l/a3stcPWINS3TgA+2grydSeO23oTz9pAjbwCyM/xAbZsoA2jJjt51EDSvSDWfTGwF8W2jvJoGHR3SKqlYR4mzjdXY8As1fk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(261102123227099003)(4143699003)(5023799004)(261026121527099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tw/aps4NVF+fzaTWGizW6QTZRw34kujYjdmyGA+bUQZhKOtz9McQUbVsd6bb?=
 =?us-ascii?Q?ePJ3yCEMXUtQC7te0SxVeRDYrolYjuQqKDNMaH/GI6TNQwJrX5dmq1O+aDIB?=
 =?us-ascii?Q?YZbteEZdvZ/zwB7hwGa1I6xkeas2t4nx6puA8D485P+fR1nNE239OjCvl5o5?=
 =?us-ascii?Q?aSykArBoODHXvT/eUyRksz7tzfnijrepnx5XPgbp9nY8RZhxBIm8Ke4ndtHf?=
 =?us-ascii?Q?2ArN1R7qjAphgg2cmZwnYjgIR2NUlEe7e8VM9CbBo+nfzUQZGjKR8MdSZUeV?=
 =?us-ascii?Q?egN/zeJ9DI4z9GW684fdH0ewOXR/MMaqyPY4BVUg9e3MemW5QsZ/k19548bC?=
 =?us-ascii?Q?8uANfkgvQVehrD1uoiZmHTVrlkoFz69cndPfWaKb7GsSJIElazl5dn4bINKP?=
 =?us-ascii?Q?6DPx4iV4VIhHXfpXpW4Tf/GP4ZnpSZRi/ET4up1g0f8RzohYiByq6/SQofj8?=
 =?us-ascii?Q?Nx6cj8gisrLlqhMujEgB2rXmbffk9f1ZRD1G4kKCA3im3bmOfl9TenyP977s?=
 =?us-ascii?Q?yTDDDHX3eVzJFCbsAJNLnmKhhB2GFJkLgyhcqqsIcAnxptHP1pdsjVwZBH8z?=
 =?us-ascii?Q?eiPoRVXl9MEcS5WM/V5TrKVFKmQwfGIMuPiJRQEyKRufrIFzSwczK4+4E+Sn?=
 =?us-ascii?Q?IFXrtrZmAZefDgii3rnds26mhADhIUAA8Q73EsbKSddtdchJtk4m73wK5ITS?=
 =?us-ascii?Q?TwWahpvCLxrlmrze6P9GDLYiCZD2sKlqSdNssS5GwecjN0lvCGpvaOfd2GL3?=
 =?us-ascii?Q?JQ+bGhFnQQBmS7QYgmFoy+4Ftu0oMyDUKsmzykNV4gjc6WL5DpkBP+DfdciK?=
 =?us-ascii?Q?Cb/h+drgBFxrcRBKYHIiNQcT6N23M8uqtvotVeI2VCLGyyH7gdhHF0P8Xjlj?=
 =?us-ascii?Q?POQiMsk4s08KZBk89NQWtqDqH13dJ82eN17NX4J2mzAt9znxFug6t8w6cVAa?=
 =?us-ascii?Q?uP+26Rtl7u029/ZjUqzLQb2FIGlY5A9qLC5h7LQrx00OxOhBH9Bj2tjzfGD1?=
 =?us-ascii?Q?FfQ4NXaIRK1IfdAIPtmDfW5wdcs1Wel250SoxF+E69ngpllHSs+r/M+8BhRr?=
 =?us-ascii?Q?0pEJLaZ6PBnSVvjtbd6lXx2VKdflpH5GxZzXeDAbO16BD/eH4qpTzOBSujVg?=
 =?us-ascii?Q?gCPTaQV2dDN3pOdEs4ChqjSvQv9S7xmxcj8ovnbYurArJ4pzW5/E0v9BjBBh?=
 =?us-ascii?Q?c5pP2anFvBI1a585eQ6rkLZDJMK9fGH7kK4Drdq5Y40xiUgxgnWIpNgP4Gsp?=
 =?us-ascii?Q?NDkpncd+jCCk1Wovadl3p7vwFi7ih4qkEy244kftg7zXOuHeDp8jJ3PpB/wA?=
 =?us-ascii?Q?xBrrAba5K8qbnPChnx9DJSnz7477NLgjl21s1ASY4f5Wo30J+xUmfV5w8FWU?=
 =?us-ascii?Q?Od5dixvD/q//dv02ya+ojYnLyv6dAS3dDJ79wx1KlhTXBMFjnQ629EKqBZ4A?=
 =?us-ascii?Q?7JFW+FTMQPQgB44X2EKAB7lBbuvaLnreJFC7J0e93CM+NgQ1t16zcT6ph8K7?=
 =?us-ascii?Q?7bxsBAqxvQMxcujLaj/xbqNlehSETVHIG3qsaffZJ2P9sv1GgisI5/4Oq399?=
 =?us-ascii?Q?7z07dWYyx8qd+kesHBx8OTaOv/Wm2mfIWhU1CEFMKrZOoXo20wkMxoDY76zI?=
 =?us-ascii?Q?wBLL8tZBrMPwi5hOZCwRk4O2C5SSqwA+VxNnqJolbB8wYM9EPHmsi6SeVDJS?=
 =?us-ascii?Q?2TKzhE2JTHXnGWefyMzCyMlDTh9C32qXblYzhT+ixOLpvvpAgEztwS+AHEmt?=
 =?us-ascii?Q?R6aVHZymYbW+cBETngE9FscLqqCpgxtx5Ojsi/0DJFe9eD/lM3WV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb5e5ee-219c-41d6-458e-08df3b88d5b0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 22:04:59.7603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9jHGDSZOcy58fLLXnW0E3ECK+B5f6AWswpmq9Z73sLvfyYN16cMv+K0L4XLFnU2XJ1y7A5c0ShWfTa3u1xa8ehMmJLkxviVPbnIfpcjpD9aKprcEinlSJcZdox/ya0P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_140509_642025_E03F7FEC 
X-CRM114-Status: GOOD (  20.58  )
X-Spam-Score: 0.0 (/)
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

On Thu, Nov 05, 2026 at 02:24:23PM +0530, Shubham Patil wrote:
> A target's MRL and MWL, retrieved with GETMRL and GETMWL, describe only
> what that target can accept. They say nothing about the controller
> driving it, which may impose a smaller limit of its own: the DesignWare
> controller, for example, rejects any private SDR transfer that does not
> fit its data buffer. A device driver sizing a transfer from MRL alone
> can therefore build one the controller has to refuse with -EOPNOTSUPP.
>
> Add tx_fifo_bytes and rx_fifo_bytes to struct i3c_master_controller, to
> be set by a controller driver before i3c_master_register() when it has
> such a limit, together with two helpers returning the smaller of the
> target and controller values for each direction.
>
> Both inputs use 0 to mean "no limit reported", so the helpers combine
> them with min_not_zero() and return 0 only when neither side reports
> one, leaving each caller to apply its own default. struct
> i3c_device_info keeps the raw target values untouched.
>
> The returned value applies to a single message. A controller is free to
> budget its buffer across every message in one i3c_device_do_xfers()
> call, so a caller batching several messages in the same direction may
> still be rejected.

can you try rephase commit message to make it shorter and summary most
importnat part.

>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
...
>   *
>   * A &struct i3c_master_controller has to be registered to the I3C subsystem
> - * through i3c_master_register(). None of &struct i3c_master_controller fields
> - * should be set manually, just pass appropriate values to
> - * i3c_master_register().
> + * through i3c_master_register(). Except for @tx_fifo_bytes and
> + * @rx_fifo_bytes, which a controller driver may set before registering, none
> + * of &struct i3c_master_controller fields should be set manually, just pass
> + * appropriate values to i3c_master_register().
>   */
>  struct i3c_master_controller {
>  	struct device dev;
> @@ -580,6 +585,8 @@ struct i3c_master_controller {
>  	struct work_struct hj_work;
>  	struct work_struct reg_work;
>  	unsigned int dev_nack_retry_count;
> +	u16 tx_fifo_bytes;
> +	u16 rx_fifo_bytes;

if support dma, FIFO size become not important.

max_tx_bytes,

Frank

>  };
>
>  /**
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
