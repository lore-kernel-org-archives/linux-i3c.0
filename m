Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73F1606A32A
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ziPhapxt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Q0F6l/6q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=onuDFtKV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kbSsNpqMDS5nGqdEdJrjFPUeJBZjyWev6h/IjufTie8=; b=ziPhapxtC0ilDSnzwaqi7ANmS0
	74WE/ZyP7wlhLqcR0W4AkQxit6dsBBjrvt/Zi/wdNXLrSLRHRbWGf8lnuZ/FvrMTw0+SFRGHFQ2hZ
	94NgFyB2Smq49+R5iHNehLfQaFKJM1Wb0PGaKCm4qclIyXYDq7TYWAAv0Q2Db2xUVkfWP9ehqmjNj
	LN3qd/oqYbdPD85E+5dW1sbXJ2L4NEOde+B0g3AHTPk5kFLgz1/1xUP9BU4NUK1dsMrTqsAzXO/h6
	poAGcl8Kc5pm2r7+b+j9uk+D5bPtSnXi4yvt+DzxrfYU1PXoz7G90C7Bp6VWQiYn6lVGxaU0TcsFh
	oJELAr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxUM-00000007n1b-3gFk;
	Tue, 24 Nov 2026 20:51:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxUJ-00000007n13-0QaD
	for linux-i3c@bombadil.infradead.org;
	Tue, 24 Nov 2026 20:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DC86e6lp9OtOSddWZKGHUkefjLtHud2P9YXBLfl5fUc=; b=Q0F6l/6q7LG4a0ow8vZab2C0gT
	DpaNmwkG0x/jcvehu4/ye65+hdq7UqW7TO3m94wSIYuQffX0/iwQ8oD+ukEIaEZw1zYkLWMsLAuJp
	BajFj0bPT9moY3Iucd28uEa8Yu4d+rpDNvrfLh+hmZWIcnWEaymXGlJLhLLWs6azjJHEvwvn9rRxh
	vwQltJ4f9U+JY43d6aAJ/8cNbWtdmx70hXVyX0qsGtxCpu2/QUzgGZnEP7pu2uJ9ojTLXqHr+KTBX
	TMrSD8fydeTUm9cKzbBqCn8tcGzVQyh80+EdeLfGgg+znUKlU+4dCu0njfOqba69Ip/cttxq8NOy/
	smR7b7fQ==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxUE-00000004YNw-3GKk
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 20:51:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icMJY5gQmZfFNJ0g6V6hQR7kqma++s6/s0+xgidmPCJvgXcsWq9XIQFrsiKnQ6nA7VINJckLUL8f6gSgL7ou//nd8EbjZkcPm9Y0GCvKFJZxQ7o4qRctxDAE8mAh8ABhDHHOG/s7PuJ2ym0nkSmC4xkNCsdVc9hjsYXY087OTGZjWgEF98DSvIBKSzmzNHAwLFwvFqO2aCcQtKS2yePvTtNkC57lvObEfOeUY8jywgwmJqSBIqApYT0uLxkcPtHZOAAviKxnHIgdTtPPRC1W5QC5r8rsFxcFWcfttrxV9OnS+wqb+vXQ4igyFvzhQ2dkDffY2KP0nnVIylgkCh4VjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DC86e6lp9OtOSddWZKGHUkefjLtHud2P9YXBLfl5fUc=;
 b=yGPanxDTGYQi4umvnZPB31onhnv0pvi1R9hU6eIa28ozJ/ydJ5XRHbUJn+wdP9eZUUq3SJJKs0daOa/JhQVA/5LXphGSGtDlhCzrJ2TGBW+pdu+P/SmMPTML/LqbBmNUIK6fsw4uK5AisGt6AqMT2+/w7WToBFF9HAEQWu3QxPtbNBBiUPcS6BSBHuxWhHuk9CuIoWZ0qwU5nn0ygrlRFqcbSCtPbaspbVu26H+ETYbiSgd1mxQ6QnQu9/LCfp8BbJJFP4BilVIaAWmbfCo4Dkua+FDRSxAdmFfN9jZ99IfYWFZOmb+zvBQygcO2H99sKYTUsg6lEvQImR8sUVDaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC86e6lp9OtOSddWZKGHUkefjLtHud2P9YXBLfl5fUc=;
 b=onuDFtKV3pV84W7+WLzSUHNWDrfUcptLo234F+mqH0RUBSgWwwBt3f3998M4e1vJ50+aq5g/F0yBGXTSC/sPM7RXdRktbFV6hk0dO1uVsrMOdvCrBMILohB8vDB3hZmKYIWooT+9g7M3mZ0dzvWIhOmMxbk+1FgJ9khVxlcibRJbCUsn0twTEd83W3FVnrs1vGs+1tvcjamp7haG4rQ9ihDY9qPozWZLWPjOmc0U1/JemWDfqgLy23ShxSm1bBwD/DXGMk00PG0ucr7bnPMfXpOmeqwMRMdl6d48t9oEzNvw9uOe8WWivagSWIr+Z/9sBStVEkG83qA/Fst1sFxMUQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8870.eurprd04.prod.outlook.com (2603:10a6:10:2e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 20:51:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 20:51:28 +0000
Date: Tue, 24 Nov 2026 15:51:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, meaganlloyd@linux.microsoft.com,
	git@amd.com
Subject: Re: [PATCH v3 1/3] i3c: Add helpers to get the maximum transfer size
 for a device
Message-ID: <awX4ymOdazAkfwT_@lizhi-Precision-Tower-5810>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
 <20261124060651.1987454-2-shubhamsanjay.patil@amd.com>
Content-Disposition: inline
In-Reply-To: <20261124060651.1987454-2-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: CPBP307CA0009.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 26177a97-aded-4d49-0916-08df4a6cb5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|23010399003|6133799003|261009223027099003|22082099003|18002099003|261022115727099003|261021121427099003|261022113327099003|261022075727099003|261022105027099003|261026140227099003|261102123227099003|261026130827099003|261026121527099003|261102130727099003|261028144727099003|10067099003|56012099006|261021123027099003|4143699003|261021130227099003|261021135927099003|11063799006;
X-Microsoft-Antispam-Message-Info: FTBBRjXzjlwvCpfUlhPEmxgJOH6E/oynjBZQe33mOyqSbfMtu+1yWcuO+FOZMmLymb69/KEhh1vuxwVGicvTlwsY5DrmAiNBg2Prb13fhdksJodVGID13qpSmKFW5N0QqDzqo2DKxwhCyNc0FIX6Oc5MMdhWmItfNI1Mh8OVEvS7qNmVHxUsAQbkMNLkQAR2iwfzEj2IUUjAqcu+Fsk+1w1qqju0yENBrnu75ccD+JzCfvM5CnVsXya8DCQLhKmySXET6DrVHih4eMsDn36DBI2ANLqiCH0C67SSR3XKtVsyuVKMER7dtPv2K8uPEd5ft0i45/GasC2K6xUepMybjMSfdmvMfDWd+g+nQTysRWSbso4rvqn5ICol0Q/zo66RD8+iM+K2f6eeMu8WKiOG+eCO5m4Zkt4mAB34lt+CWnpzWqGd2qx+u6aIGKMdZwn3JU5qrBO5Er5PM4biiM/NSdzze5+79166fWYQzg9lHGoiLnkJsJ9ZklFzVS3xC/hY3xsA6m7x0erYe6He2FBaz4Z670EVZwr4UyKrdFxCL6YMX3y9mw5WKqzGpEKx16uFvKyvEmFzQGLOATnUJTjyiBM6pkK06lDyORAn9713bkLT0b53DcVCPNudW5H8QiKPf3z2vtcmxs8pQZN3tKQo8GcDOlrxK797W3yVQFH9u+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(23010399003)(6133799003)(261009223027099003)(22082099003)(18002099003)(261022115727099003)(261021121427099003)(261022113327099003)(261022075727099003)(261022105027099003)(261026140227099003)(261102123227099003)(261026130827099003)(261026121527099003)(261102130727099003)(261028144727099003)(10067099003)(56012099006)(261021123027099003)(4143699003)(261021130227099003)(261021135927099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uZ/3a6fwm3b1+USlsN+2zPg40ED0Q+99Xr6dn0GgpcYaEmFOQGuXI9T3cMKm?=
 =?us-ascii?Q?V5MMhJ4WffazXW1yDIXM9jUmUzBBx9Ux5t5rp+nKK2AufPmYTXerXqADIoz0?=
 =?us-ascii?Q?lV05F/aRi46ICC63qVgvFWDY6RfucE9xruadqo27c37lDk+78jLl21LBEImH?=
 =?us-ascii?Q?SYzKxK+Y2Mdva6EsDqC/Bs6T/bd3nwh/g1EhUjLi3AMebRELg0pm3543WwCv?=
 =?us-ascii?Q?3ER40yTlDwtbhT1el3gZKkBY6QZxYVyabXLnHbRe5q5deGSRPyz1iwgPEvN5?=
 =?us-ascii?Q?baEVAe7wwD/14vadkxiqfAkiERx2Um8S7iNRO9Xa0LBAbT6nq+syCHuP3vx+?=
 =?us-ascii?Q?lFd8/8qvnqXDfwZcGoPtZUhkM9xOfz8XB13pAZsJRm/1Xwws5UkdwQhla4Ah?=
 =?us-ascii?Q?0+IHzTD/JDpR5RkNZmpwXng37s0pQ+3ABIMLj3Nwc98cIGjlbEvhyeyupuD7?=
 =?us-ascii?Q?+NyWQRLRgX7adSDD28osGahpIAM6gKfTWmo31Kl+dww4YSNAVPuSY5oBFS5f?=
 =?us-ascii?Q?J7BMm0pyFYcySx6H7P0yXllh56Ggwo4dDlmvlzCNDKeL7RB/IAnUpCsrXa5L?=
 =?us-ascii?Q?rGrxsAcy4pDTVr2RqVaxQtkXR/s1DoiGyIWt1ANgwNYmNoBGL/gXB55kx+bM?=
 =?us-ascii?Q?9sNvxXjnr9BeYcxhSCRsfz1nqYBGUfJs1lrHhybuBudrLrpoqW7n/l70ny6B?=
 =?us-ascii?Q?OGu02/BF33gH/lGyYbjy4KAj0vY+K9UHxCviU+fFAKHHbeGs6KOS+MKnmaBe?=
 =?us-ascii?Q?oCBuAnnMZs1WYJCkxNTe1OXOcAOQtuXnjAcFEkN67TqMJvr5ogR1kDNZKEcx?=
 =?us-ascii?Q?j+2kdJfdmoNxyfK1qIgqHPjRYqJTxyRjkLaFNP615f24Qc7JWdHIp3LG+RxN?=
 =?us-ascii?Q?kcojCmzPE4Xu7qdETwSjutEMJG/hhTHVCrQ1Pi9JZXprWZd9aYkarGk41Hxe?=
 =?us-ascii?Q?Itlfe5BYajribdyEVS0nmzXEVlDAa3uTYVJpstqkEHGJT7AxZQtOy1i2XTQR?=
 =?us-ascii?Q?hy+Dgyr7LqmDS6kkpbM7D2H9IIrNfdUz7lZNVz9CRyzFSAClW5OwyR9zIOKu?=
 =?us-ascii?Q?h2KnbGy7LaVniwiNsWCU0ZcWC49AV6nu59Hi2i++cxQKw1XO8KShKBOVqinw?=
 =?us-ascii?Q?iy0vusYqGuEKIg+u/WFRSmD+OG9t1W8sXmM3ofSW+4QUBxHApv30ujcDqzVe?=
 =?us-ascii?Q?R7udGjiOByp+287G2lS5mUqx2/1cvHYB3hFeVakUjBQYdEmYNTjEK3WQpG28?=
 =?us-ascii?Q?BUNSHRkjPyBNPmmwFv1sD4tBP6Pi3CK/YU1OM95tRJAvGabKCfmuSHpH0JQD?=
 =?us-ascii?Q?C/JI7W9z5jHl91NcOkOzWO25Y4DJdR8HuVBgYWey1qhArwCoakFVt9qVA6S1?=
 =?us-ascii?Q?3XcngtThyK9/vfL0P/v0oP4iyx6a5ZMcszDFT+D9Izq5QRbLm5ayeh1X3NSM?=
 =?us-ascii?Q?ZvUQOXaTn/zN0DbXZOMQzWiq6uzomqeFBIRWWSnSxHoi3WOfamK20HuGVvAx?=
 =?us-ascii?Q?lBM6bHaFbPxb6UsKGNgGIwrfwfJkqdbS7Y/aZOgWAEQh5CMnkWwrdXHiStZv?=
 =?us-ascii?Q?uYdBM5yvLGZaFFs88EgCMANMOt8Wn39/iyCOZ4ksJQiDgYmlwsBip5EMrcKy?=
 =?us-ascii?Q?nUW5UXUli7BjY+A6oaXAeXgAYXs6qV0DGLz3rWLir5Fd2p/yXvdd+Oh3lxL+?=
 =?us-ascii?Q?YgONlTNTeG+tRd8dn0svoAH8EjzI1KeqzVAlbfrjvr1skDOol16Kr7yuuLZz?=
 =?us-ascii?Q?TeSpLBdInQOzlDqhVMnW1hMdjF15OUoy8K1eA+oBL6iwnomavJcy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26177a97-aded-4d49-0916-08df4a6cb5fa
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 20:51:28.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXER1jTpYJmxEmXHPiVZ4r5Y3oBLiL2LApeCf7vT2eunijL0nyiGlimwo+mhrtzsb3/QBq0VmD6u/97702zt+dF+/148SdVo+lGrHzUNkrC4F1HLpDyelL6ampQGtvog
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_205135_195457_698D2F80 
X-CRM114-Status: GOOD (  28.38  )
X-Spam-Score: 1.9 (+)
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

On Tue, Nov 24, 2026 at 11:36:49AM +0530, Shubham Patil wrote:
> A target's MRL and MWL do not account for controller transfer limits.
> Add max_tx_bytes and max_rx_bytes to let controllers report these limits,
> and helpers returning the smaller nonzero target and controller limit.
>
> The limits apply to a single message; batched transfers may still exceed
> controller capacity. Return 0 when neither side reports a limit, leaving
> callers to apply their defaults.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---

Nit: if need respin, change subject "helper" to "APIs"

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
> - Rename tx_fifo_bytes/rx_fifo_bytes to max_tx_bytes/max_rx_bytes.
> - Shorten the commit message; no functional changes.
>
> drivers/i3c/device.c       | 49 ++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/device.h |  3 +++
>  include/linux/i3c/master.h | 13 +++++++---
>  3 files changed, 62 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 4df4682af150..93adf4c74004 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -9,6 +9,7 @@
>  #include <linux/bug.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
> +#include <linux/minmax.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
>
> @@ -106,6 +107,54 @@ void i3c_device_get_info(const struct i3c_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_get_info);
>
> +/**
> + * i3c_device_get_max_read_xfer_bytes() - get the maximum readable message size
> + *
> + * @dev: device the transfers would be directed to
> + *
> + * Return: the smaller of @dev's MRL and the controller's receive limit for a
> + * single message, or 0 if neither reports a limit.
> + */
> +u16 i3c_device_get_max_read_xfer_bytes(const struct i3c_device *dev)
> +{
> +	u16 mrl = 0, max_rx_bytes = 0;
> +
> +	i3c_bus_normaluse_lock(dev->bus);
> +	if (dev->desc) {
> +		mrl = dev->desc->info.max_read_len;
> +		max_rx_bytes = i3c_dev_get_master(dev->desc)->max_rx_bytes;
> +	}
> +	i3c_bus_normaluse_unlock(dev->bus);
> +
> +	/* 0 means "no limit reported" on either side. */
> +	return min_not_zero(mrl, max_rx_bytes);
> +}
> +EXPORT_SYMBOL_GPL(i3c_device_get_max_read_xfer_bytes);
> +
> +/**
> + * i3c_device_get_max_write_xfer_bytes() - get the maximum writable message size
> + *
> + * @dev: device the transfers would be directed to
> + *
> + * Return: the smaller of @dev's MWL and the controller's transmit limit for a
> + * single message, or 0 if neither reports a limit.
> + */
> +u16 i3c_device_get_max_write_xfer_bytes(const struct i3c_device *dev)
> +{
> +	u16 mwl = 0, max_tx_bytes = 0;
> +
> +	i3c_bus_normaluse_lock(dev->bus);
> +	if (dev->desc) {
> +		mwl = dev->desc->info.max_write_len;
> +		max_tx_bytes = i3c_dev_get_master(dev->desc)->max_tx_bytes;
> +	}
> +	i3c_bus_normaluse_unlock(dev->bus);
> +
> +	/* 0 means "no limit reported" on either side. */
> +	return min_not_zero(mwl, max_tx_bytes);
> +}
> +EXPORT_SYMBOL_GPL(i3c_device_get_max_write_xfer_bytes);
> +
>  /**
>   * i3c_device_disable_ibi() - Disable IBIs coming from a specific device
>   * @dev: device on which IBIs should be disabled
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index e30ea2cb13cb..cb3374e4f9fa 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -331,6 +331,9 @@ int i3c_device_do_setdasa(struct i3c_device *dev);
>
>  void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
>
> +u16 i3c_device_get_max_read_xfer_bytes(const struct i3c_device *dev);
> +u16 i3c_device_get_max_write_xfer_bytes(const struct i3c_device *dev);
> +
>  struct i3c_ibi_payload {
>  	unsigned int len;
>  	const void *data;
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index d58070a72a49..08a26aa9c164 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -551,11 +551,16 @@ struct i3c_master_controller_ops {
>   *            context (notably the resume path), and is skipped if the
>   *            controller is shutting down
>   * @dev_nack_retry_count: retry count when slave device nack
> + * @max_tx_bytes: maximum number of bytes this controller can transmit in a
> + *		   single message, or 0 if it has no such limit
> + * @max_rx_bytes: maximum number of bytes this controller can receive in a
> + *		   single message, or 0 if it has no such limit
>   *
>   * A &struct i3c_master_controller has to be registered to the I3C subsystem
> - * through i3c_master_register(). None of &struct i3c_master_controller fields
> - * should be set manually, just pass appropriate values to
> - * i3c_master_register().
> + * through i3c_master_register(). Except for @max_tx_bytes and
> + * @max_rx_bytes, which a controller driver may set before registering, none
> + * of &struct i3c_master_controller fields should be set manually, just pass
> + * appropriate values to i3c_master_register().
>   */
>  struct i3c_master_controller {
>  	struct device dev;
> @@ -580,6 +585,8 @@ struct i3c_master_controller {
>  	struct work_struct hj_work;
>  	struct work_struct reg_work;
>  	unsigned int dev_nack_retry_count;
> +	u16 max_tx_bytes;
> +	u16 max_rx_bytes;
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
