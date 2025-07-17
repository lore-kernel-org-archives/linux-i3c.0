Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DF2C83F1A
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Jul 2025 18:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KETeY4zLtfAgxEehv0CFS1rWI7P8AMOpRXUR7iIuXDE=; b=yFwDAIVo8BHXCb
	zYKSzyUIbGnweZ/o4nrjeTzB2aTxm18m/EjwEqWF9L9bUDQvlorIpF3Mnz7vnB+lpnj3mT+ki1hqJ
	/D6WOquJi5dA1zH7AqmdAK3xVg6gYp/qKOdU0t2JU+djqlM1naZWsNN09R43QPnQjI3IXFWMGYMoV
	1PVfFYDf5taoWMs91XQnCpm+C7fqPwvZ1sg8WhryQM1YUg8iSfpzhX1j8iaAU96W1gqwgRHzNuCQC
	iN7XX3af1SmBUly38dlF18pd8hnnUYi/V1EGflaQgb6KfvWX47n5lDrfcdoECYC4pccqh/V+0aQQv
	NWnrFlhA2LEkx9QuadPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTm9-0000000Awxg-2CoE;
	Thu, 17 Jul 2025 18:56:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTf3-0000000AvtA-3gur
	for linux-i3c@bombadil.infradead.org;
	Thu, 17 Jul 2025 18:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PdpVbjah1VqH9ezJVy6y4h5GJIxy8A46F74FvAS1uXI=; b=U0ZP5ChyIDMXjKzUYS/J+njzSf
	UpFl7ZkwjFoarslQYg60cyxl2qpIBV9XySqBn1QNM8kerXJaeeMNi8UMq/Z/6pb8B1NulIbVmCw+Q
	Fkj9XcwYnoJIaLWLRBBAEGa39Yghl332gLQGETh6P014TM0AsD4LLz0rUV6YlFtecdaHEjqOrzR+l
	bxKCTbelUYb8Lv8KMZ4hMXOmc1xQjxGH48+TD4rHcq01ZBxxQxPIshnbtnRSqfMBpXjD72QLerQ3Y
	2mjh79KXlw+3926iidbvo0r3ghppVh+zNJT+1to4T7UQqQFheTpb26er3G4olihUvad5fqtVIJK/3
	OAnrfTFw==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTew-0000000ALTz-3lX7
	for linux-i3c@lists.infradead.org;
	Thu, 17 Jul 2025 18:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ef4AF8mrwKE3bBgHzcf+q5/jfeFXOBFhlrr5ZoE5+MYWpIJQHxlJ8/nRh6WW9mqaPbYXUban86kZv848CtwL0EKbXeSVdpw1Yvc7r6eA3I15zKhi8NmPURCdNUZX/VpTvWAxg7HPDD7Qo/r2fBq7853XcxEGHo+90TBPhDRrDG2YTxwOl8pEbbCFW25omIzV8oph4W1K+TmGnBFIpt2DjVs4DHXR9SIsNPkK7GGsxBsspbsG1Tk5HEg9kKEU0EJ7We8gQ1pX++gl2M0kt3JBMEgArQjxOCJIBFqPhTzTVl2ttfoa6H4+2qcuIEKZWZd8QgEGuL6E11UjXuUZEqmN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdpVbjah1VqH9ezJVy6y4h5GJIxy8A46F74FvAS1uXI=;
 b=W0X/DsgmavgjtE/VchyVGpyVc/yuMcTGSRZmNgO4VIygHr6VfrLhkpQlkNlQuZTm1V9ZsLKq+Nhwm2cyt6AKKIOYBp5oyIwbnZTeg8krpieTWnwDRgwgdsGn7EnBvdKh4ZqHgO3DqX+aLEhqt56phEofoutelFYEy4XuLl384FqZ8OL1VzQzuyvKPT8bPzkZpoFBKtDt7vuztPKCbY/5iKsNkoiCJ4/XS5ibTuOvM9IJDxBi4laMQ6uCQBaECFyvPcJxGXV6wxzBgJqWKTRzntcCwRUN5cFRV6TZJlvWn8pC4RS6tCiAgNQqrKGMYzEOSyDTL2Ad7+6sfcZWDLOXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdpVbjah1VqH9ezJVy6y4h5GJIxy8A46F74FvAS1uXI=;
 b=HCeXrNCbW2au9JQsqSA8tCkVaq3UKp9MU3lIkPBAC6GSqPCKV5HbrbV/9sekL16L+W7JRA6srttcgyc0w7C5DcTZ6iB08OiYZ5EezIu0z/zyt7GSI9Jo8Pa+Ih4q+GnbeeI7JJR3Pn4C0zCmIKgSI3jyvgVoRRyBeUx3UWwhWn2ybQZ5dwJ54zIGMox6nAtOFuRgtfTklPDDdm+pNnzYZJlwMu6Wrn6x44qi9tUDeUP2aFh4RM4nKp/9rW/AClUxLdz/8zs7zzYWFXdHoLWF10FtIQLYJBsylsSjMIULyHMX3OyUN3t+HXH2UWmX8i2IQn8pCwYo3fQ8kgY3WWeBnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB11411.eurprd04.prod.outlook.com (2603:10a6:10:5ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 18:48:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 18:48:43 +0000
Date: Thu, 17 Jul 2025 14:48:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aHlFhsdRkURwZOdy@lizhi-Precision-Tower-5810>
References: <20250717122455.9521-1-wsa+renesas@sang-engineering.com>
 <20250717122455.9521-2-wsa+renesas@sang-engineering.com>
Content-Disposition: inline
In-Reply-To: <20250717122455.9521-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB11411:EE_
X-MS-Office365-Filtering-Correlation-Id: 204382ba-fbff-4694-49b7-08ddc5628d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|52116014|7416014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cndtaTcE4VQgt/YJlV2/sNfGFZo7wKI67Io8nZYfz4mww3HJv5PAnIkPSzgs?=
 =?us-ascii?Q?Cs472rYRfCBoXV9fy+PGVBMB9ttv+OcNo4jQjWvEu8p0jkh//cRqneugMZOx?=
 =?us-ascii?Q?+upjktuOyF+vW2mkWnf5fK7iCzA8mSa4qqUm4Hkk9WPNuXC7wgiot/YonM2P?=
 =?us-ascii?Q?e0DFn9PBg5wz50qv4ZXbRzhYSUXW/NzuHGgRxPWELtt1viVHGcsXD/ptJRte?=
 =?us-ascii?Q?l7Uwg9ShTXcHbRS4lZsaZhusvM508cdI1jTa5h4vyk5kjf6d0WUL4NtWNEtZ?=
 =?us-ascii?Q?1hhpSXOJjb+Qbvu7+E7ArcubMK4CnW+ZwHM74IHfgM1zsu07MD4BpcUJ3IlZ?=
 =?us-ascii?Q?3k4W8iUGOlBnSS+t7aZtdWAGg5v++leTXCwH1ufHtc3sxcSZKT7XWRTLEmL0?=
 =?us-ascii?Q?SP5jQo4Z55NG01+US6Wuzn2VNraWLEQYI1PEgFgg5LejNIVvUS8ihSilD3eG?=
 =?us-ascii?Q?vxtrsweeqIqXv9UG65DsaHGohkqc+Fe142QuNzCSIP+Yd/NW9BmJRP8OuaOc?=
 =?us-ascii?Q?jcVyf8eUoxfuYvcAAFcudb1ENzFbpBiMUstfOvfQkKp7ryTVjK2HR3siLSw8?=
 =?us-ascii?Q?IyjDcJCLIalfnWzUvHtKfgjAZSdWbt8sgHVGSlncFV4ENHJsSEv2RkBmE8/E?=
 =?us-ascii?Q?zRQTVbL+pzcp1T45UDg4eJKHVU1EwiGAsI6YVb8VGiraUjZfx0Eh3ZfpDlCg?=
 =?us-ascii?Q?IEdPcDZMmYDD25TVDlUbW7tk+Gafygc7wf6b+2PecvvUuU3pn7R8YSf8BnsI?=
 =?us-ascii?Q?d7I4YN4umEL7RqRlixUgsPLOuv/tkc1RNtoZWU2og0Hs82kHXh7GAR8O9Gga?=
 =?us-ascii?Q?bDEGVr3eGRO11JGIF9IjnGyeH4krhrG/DMGaFnbAB7BB3+T055F5F2Ur1Mm9?=
 =?us-ascii?Q?0fBZwMAQ6IvgfqubMVy6mOHGDS1vp3rJYoiW/aAjSZCSlxqVSDraUcOwSAiA?=
 =?us-ascii?Q?LizvbCDIPeNEnLG9vLaDCdXlg4XJbb9VcshZbPzdH90yh4xP4kLOhb+GtUjG?=
 =?us-ascii?Q?ENqKJO2lXGNLnErCPfpa+QJJkyJt11me9ZHQx8QT6m0dgOrSo7WbDNvxWluE?=
 =?us-ascii?Q?OG840ubA/oHVhI6Bl9F6PuSTtbxGkQrO8xG7/0InfGHMlDhr+to0veWUiZ81?=
 =?us-ascii?Q?dW8fpg1myduh/+HC1QTzxastdcoWhQFUkSYwdslaa+swISnzXycq9bxYBSQg?=
 =?us-ascii?Q?tlMEazG15ncprEBoe+xYfBzVvwIZ8Svj9J3NVDMoRtLw8IwDQK6jC5Kf6qqb?=
 =?us-ascii?Q?h6sH4ugPLMk9/21BROTb5sLNHB1yDeE9c8PTFQL59j80b/XwJ3qVELdha07N?=
 =?us-ascii?Q?6bz6+jstuExcqyg8nbKfzXflEXNfgY6xuc7w874DrAA0+8aFYpOIFyhT1EaA?=
 =?us-ascii?Q?hZ8rZpNcVTtlPU6lXRrGbu9DiyOEAiQZc8sy1oYwuc9ivirRlbhvRTNao2vS?=
 =?us-ascii?Q?WinAChSc20ccy4lHbpZ6uuaTLrfJStwO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(7416014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zwYRmgb5zAfX49uGAxQigIfXycMnSCkxc8Oua4ZnoGFq5PsbtEOazYJOK05N?=
 =?us-ascii?Q?GkqMobNsDnVmqXmD0Jx83eXQQoxrkahTdWPyiNg/sE4Uyb3jIpjlEiJArLk+?=
 =?us-ascii?Q?LPDvcB3mKGQn6CV/EusPKoQsPSevihVtFTgwdboPHKQHGifSC5XoF+h1ud1P?=
 =?us-ascii?Q?nJQR+pfCB+EbMozwsFYxJd61LTW4UyHPr/cM7nPppoqeVpQoWIzolutx83Jl?=
 =?us-ascii?Q?tBce7BTc0+ojgoMBSq7Fqqe0yOf3ia/uiITIwl5dbqWPDCtkXRlBrnSRg+3a?=
 =?us-ascii?Q?XAtZo4+h2pM8TSruWXJ7iD5rXkMSQIcIOEqe3AQiA+xRSp7QewG09W6YrsRm?=
 =?us-ascii?Q?hyrsTd1gLOkoPNNqI9eqycVj4OQsPzCywqaVoZOzvEwUhbwbH29ZPamLe0HM?=
 =?us-ascii?Q?dcoofRGFtIqJ8I2AhLpJSwiJqnLa5h/wrCfzUr68ujkd6pPWcaTIiK7XhuL2?=
 =?us-ascii?Q?XmhcnSNzuMwe00pixlcPwD5gJHIjeRNVQnt9Jatxnj3gukjGnZOsSoZkWbWH?=
 =?us-ascii?Q?6YL6yMdce2gGi4+xE9Y88nITK9NqsPDTfJY+JRJIqwv1R801f147imV6kEN4?=
 =?us-ascii?Q?8mdyP+FmBTng81/8SXG5bOX2vfGwIE8ILGXJ8+nbd9+CDuElq3w+BjelWcXl?=
 =?us-ascii?Q?fEEVRw0GAbMXTwNJXqYfnQTjbrLQEtZw/r0e/HvTLuyK1AYSkcRYeXpdjw7H?=
 =?us-ascii?Q?eC+anGnE7sadfTAf9NklHdjgADzWAnX4m+en3N2S7bme8sdOTHor47+lrLzs?=
 =?us-ascii?Q?iGt31pfAo7uWFpS/yH0w8AZ9FLycJWsjyXwTN97rZ8hj1xqBWpF5bjFd+5me?=
 =?us-ascii?Q?Ge6Utrlt63HP3wMjWSSfYy0VLNCVjUWLeC+qA+V+mqNOJxTWd+M+2N36WGcK?=
 =?us-ascii?Q?RQUWDVVG9HRsa/w3C5n3P4WwMTFolBIEkoLgy51scycJii40k58Hr8+idbIO?=
 =?us-ascii?Q?edYpqeeQSUk+otPwjOpHZqPzAzp3Ez85HNP5ZoLXZny6PtR0ADrGOsM3+LZU?=
 =?us-ascii?Q?/LhQQlsJp67jEeaPC02EH9M2zRoMu6Tpl86q7wsr3C4NW/pNwMp0Q4z0LKCw?=
 =?us-ascii?Q?LBfYAkL+IuBb8kZnIlcNeXNZ6LkdIOv9eDxILDyuCwSgCtXIq6EbgyHKNnYg?=
 =?us-ascii?Q?4Ip2Cv8v8aYDVCfXJvlkdb20sRhMHytLCzUW+uDEH4UUKrg5TPxHEg9EaEdf?=
 =?us-ascii?Q?WTINNKa11Qt/+Bv8KNHv6w6cV7bTLc6E4kRjmcHqpmvrFH3p5FCag0YbOJ/9?=
 =?us-ascii?Q?dAhdeVxFnaU9MttYLTeTtvB68frCW3A1gQ1AZ70UicgzEUCDsPcvNyzlAPUr?=
 =?us-ascii?Q?WWnTvqWoCimSRaz54mC1TU4YMiuuQJpl6iaP8UJaXC+52RNsGctOeARU2J+h?=
 =?us-ascii?Q?D0r1DH9InzI9IsvKTbn9OGjWMiuvV2fHJv5DC3ozWHyZFNaW30PbDVxRsFJh?=
 =?us-ascii?Q?6U4xT63rXv5TU9pRsrNT75XceYy6/dke2jahOJi/BjQ64e9k82OLGSesdZkZ?=
 =?us-ascii?Q?V33GlchM/Ji8CbUHJTEZ6cwT/rpmGlfNui24qamfnxo59G0LeKVVwhof+YXp?=
 =?us-ascii?Q?GKwZlnJducirecovpMUBZpG9+pHr7kYfrrwyWjxQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204382ba-fbff-4694-49b7-08ddc5628d82
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:48:43.1362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwUIpfNoR7y3H9nZKryoqZSCeSD6lsQzg1p9cSdVWvBZBkGXFwOwtnGvqd9aZQj5VmjPG+G9YA7nmynawgwi/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_194847_156606_49F2553C 
X-CRM114-Status: GOOD (  16.07  )
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

On Thu, Jul 17, 2025 at 02:24:52PM +0200, Wolfram Sang wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Subject: remove binding.

dt-bindings: i3c: Add renesas I3C controller

>
> Available in R9A08G045, R9A09G047 SoCs.

Add renesas I3C controller, which are Available in R9A08G045, R9A09G047 SoCs.

Frank
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * removed useless generic "renesas,i3c" compatible
>
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> new file mode 100644
> index 000000000000..fe2e9633c46f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -0,0 +1,179 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a08g045-i3c # RZ/G3S
> +          - renesas,r9a09g047-i3c # RZ/G3E
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Non-recoverable internal error interrupt
> +      - description: Normal transfer error interrupt
> +      - description: Normal transfer abort interrupt
> +      - description: Normal response status buffer full interrupt
> +      - description: Normal command buffer empty interrupt
> +      - description: Normal IBI status buffer full interrupt
> +      - description: Normal Rx data buffer full interrupt
> +      - description: Normal Tx data buffer empty interrupt
> +      - description: Normal receive status buffer full interrupt
> +      - description: START condition detection interrupt
> +      - description: STOP condition detection interrupt
> +      - description: Transmit end interrupt
> +      - description: NACK detection interrupt
> +      - description: Arbitration lost interrupt
> +      - description: Timeout detection interrupt
> +      - description: Wake-up condition detection interrupt
> +      - description: HDR Exit Pattern detection interrupt
> +    minItems: 16
> +
> +  interrupt-names:
> +    items:
> +      - const: ierr
> +      - const: terr
> +      - const: abort
> +      - const: resp
> +      - const: cmd
> +      - const: ibi
> +      - const: rx
> +      - const: tx
> +      - const: rcv
> +      - const: st
> +      - const: sp
> +      - const: tend
> +      - const: nack
> +      - const: al
> +      - const: tmo
> +      - const: wu
> +      - const: exit
> +    minItems: 16
> +
> +  clocks:
> +    items:
> +      - description: APB bus clock
> +      - description: transfer clock
> +      - description: SFRs clock
> +    minItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: tclk
> +      - const: pclkrw
> +    minItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: Reset signal
> +      - description: APB interface reset signal/SCAN reset signal
> +
> +  reset-names:
> +    items:
> +      - const: presetn
> +      - const: tresetn
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clock-names
> +  - clocks
> +  - power-domains
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +        interrupts:
> +          minItems: 17
> +        interrupt-names:
> +          minItems: 17
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-i3c
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +        interrupts:
> +          maxItems: 16
> +        interrupt-names:
> +          maxItems: 16
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i3c@1005b000 {
> +        compatible = "renesas,r9a08g045-i3c";
> +        reg = <0x1005b000 0x1000>;
> +        clocks = <&cpg CPG_MOD R9A08G045_I3C_PCLK>,
> +                 <&cpg CPG_MOD R9A08G045_I3C_TCLK>;
> +        clock-names = "pclk", "tclk";
> +        interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 294 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "ierr", "terr", "abort", "resp",
> +                          "cmd", "ibi", "rx", "tx", "rcv",
> +                          "st", "sp", "tend", "nack",
> +                          "al", "tmo", "wu", "exit";
> +        resets = <&cpg R9A08G045_I3C_PRESETN>,
> +                 <&cpg R9A08G045_I3C_TRESETN>;
> +        reset-names = "presetn", "tresetn";
> +        power-domains = <&cpg>;
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +    };
> +...
> --
> 2.47.2
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
