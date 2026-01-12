Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC00EC9EC8D
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Jan 2026 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hqq6a0DnhVTMEHJkzCk+Nu5u4Z1qHi5oQ/jYu8PQ61Q=; b=PRBXZzgTK8PMG2
	3htCBdN/HpNz+GsUcGya0YqrwdEIgI8rrkg41bP4tQdT7BdJHIbgMo54RVSk/2Bu/h8BcBfgyUAk7
	06Ay6WKNEn3QNZIHd4zYpuhyChv3HvOhQW75z9FDVBopsvQZMtpklyLmGl4zm/m6BQVhjVEWHoJ4q
	Cj6lLEpj5ddcYq3VaYewz+hzReiBgNjz5tkTPI1PV3twy323gIqX+2Y5MMVqmC34VUROl9cznOJRv
	LY/vXrlrFWP2X7sEkyVJ09xGHEJ0vQHPk5Q4LkTFlvGq2KhflbIvZf6aFUUwE527Ki59pkLsFhoCz
	9tT2GTYCcDJp71LcvbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKP5-00000005h3r-1Huu;
	Mon, 12 Jan 2026 16:04:27 +0000
Received: from mail-northeuropeazon11012062.outbound.protection.outlook.com ([52.101.66.62] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKP2-00000005h2n-068l
	for linux-i3c@lists.infradead.org;
	Mon, 12 Jan 2026 16:04:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6DgAH62OW3f0ojc5k3QW0zV7MKtjRMnL92Y7xcJT/0dDoNXGmCxIYPR/ICpUCVvxUPj6z1m3dpAy8FpjiqtyvloXvZTsWeZmBjnt463xVeUJMsQxLCCqhn30KwUs1b6ATKMIE8j0CACZC+Geet9VYgGOZqQjkWLpI5jgVuAREYqyJXAE66r+7RwlltS3Ca0lrJwoh/CuT0X454X2MrEuIOMYrPKzlbU2O+vlivhL564EMQGOerBS+PZFxcvqTPAQI9z53/GsQ8wvQuLr13ewc8aMgtfIvFI+CKEs3EyqhgEpuVxRgQf/JD5X/R3NQn//XLenqDphmkzFrYazLkiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2+H4jJ5uZt3F7Jh7wDwNs7tN57csYYft6UvhRnH4Yo=;
 b=AeTm0OK8pvQJbWTe2LaJU+EDuWWLxVtDIwzPAtf/mmmsNVfhGJXcWcM/sAiNB8PhkifMdx8qNWRB6D/wFpKDdO8sOPUrxR3chyk9/CP1jdaoTlhFEK7aln6sPl/+DdwpdquN2D4qmdX6CyHEgUqvajHaJxdWhau3mqd39dbtnEg8+uJiD5TveW8C2Y/vFPJspjNxIipGo5gjRzt2NySJUE2z38L298CNujcjAN8ke82GnAZdNBncaQYYIBvsh7yyir5ILdInGgEJpwE+VxDwdCF+q5a6xXKfa5aclaQ6Dj3Jp0vk8I6vPSo0uq8yoCp2R7X0jaBvnELtE2EtAdb1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2+H4jJ5uZt3F7Jh7wDwNs7tN57csYYft6UvhRnH4Yo=;
 b=ActmTn/0zAFsYhMV2yVlS61ZfqgbPa2AvrAsj84NVIhlUigvWU/4vE4x6D9SJfohWYFCanUXlBpk4pzUSSbHw1VwUxweVDLCkskQFgQ6bH96T+u+p0gTBpztc6zV5VsdyvQVkFa5oxq3wCALJRKF2YUkWZOAkFWAm5tJur5mxHirl2WfeNsKyvZCr33Cn4ctxS8tk1RB9/PMKVByOqWKxPJsXlQ5xApy9jJTI6DAOx9CtJw7Bt1k7vqcvG9355qqctI81rOB5yZeeBFwtzoRkDKz7VGbEmwdR0ZYX+H86JBV0K4cvJc7/FmC5gkRGs54YL/vHsKFum15Zp5+DArgPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV2PR04MB11424.eurprd04.prod.outlook.com (2603:10a6:150:2a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:04:15 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 16:04:15 +0000
Date: Mon, 12 Jan 2026 11:04:09 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 18/20] i3c: master: Introduce optional Runtime PM
 support
Message-ID: <aWUbea5q62ND2kTi@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-19-adrian.hunter@intel.com>
 <aV/Ix3i4/nO54vDf@lizhi-Precision-Tower-5810>
 <c8ba6f17-9a90-4da5-ade8-f0515a69ddc1@intel.com>
Content-Disposition: inline
In-Reply-To: <c8ba6f17-9a90-4da5-ade8-f0515a69ddc1@intel.com>
X-ClientProxiedBy: PH5P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::10) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV2PR04MB11424:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bd59bb-9bcc-451d-c69b-08de51f43c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6qHkcCpr7JjqisecbFuURZ7tOkQpmMK1rWBC5ANALo2Wo7fXLtmdI5Qk89WF?=
 =?us-ascii?Q?Te1uejXICwVO8icBFFakhkSCqtlW2ecKTkRrkkrWGMv9BArs/qNqSx/TwkXN?=
 =?us-ascii?Q?TafrQm368HMg7D79wthRT3X13a84UuB5qUebnJJBQ5QFp0IOkF0Xu1Fhaa41?=
 =?us-ascii?Q?2CLqg1T+WI8jSlRBPmV8soSweYXgwtU1kxbH76KVDbB8TCOIqpdFimCtXHFh?=
 =?us-ascii?Q?FYLEGtcRBnLFUjv7sefC3WsIf6fdLfo2//v0b+RS041lq1bGBT1hOYeGKUkI?=
 =?us-ascii?Q?IQ5zmrBTAQO2EVLyVcBtxIYaDInCWvykJSybZ1ie4G1DdiWtjU2T7XevrKeK?=
 =?us-ascii?Q?LEpO/cdfxQTQEgb6j4r1b2ySYcvavFFqJez32YNV2SDkpZNqJn6quZEsGKNg?=
 =?us-ascii?Q?9Bz3yrv0s1P1futzYPn7J3hKoccOOD6yMQ7pJhhFaIE69vNyO5vtUj8w41xK?=
 =?us-ascii?Q?IWwyv7Kwx+1wbIj8jC7O5014r7anUcuSfoV2aRDYStcqIc5P4BVoldoWvF0A?=
 =?us-ascii?Q?Kp4wza/NP7YwaoQT2R06oQxyIocy4DpPhv/rNmRaiXVkCskgYAdfx9yzghZ/?=
 =?us-ascii?Q?uw2wnGamFpoxh4wPO4Usm+PN12lSBoFt/NY78ANFOE5oUg8LDAgQvXnUPzt3?=
 =?us-ascii?Q?9gQUFN4D4iHuHgIV8KcilB8erh1H53ZMCbI7k+y4HI+JRjmN2axtHF7ATOIQ?=
 =?us-ascii?Q?ON6yb/Jxubp2YmMuTeRE5MgKc+0RB9GqdFgPooZnJOC0f7oz3G1TRpjRYJWk?=
 =?us-ascii?Q?GW64tKpMZ8TNoMjEKtg6zRT8qYwjtoN0tDj5u5fv3MufXNEt2J+lr7q51tdn?=
 =?us-ascii?Q?PoidYW8YHd/n2yySkQwIaazMh3qqkYxKTsqFRMHJVWLZtyq5Jj9uCMgbMKTN?=
 =?us-ascii?Q?c6Y+8qf8PvDh7RXxTJHhUM6vafEZ1HDEQvp5vDVKQ+17i3bBpnQAOos2vuR2?=
 =?us-ascii?Q?3JC/mNctByhUk7WodpH8XsAEvi2zToZEw5Z9DJ4fT4Wp/buTFHXWL0XGX1WM?=
 =?us-ascii?Q?OVtu0PPjctvSGaKRVPqRYE3VkIPOULH2tTj+hV9GHS5bZ4LwY27KSmvfNejw?=
 =?us-ascii?Q?cVDdJpwMnts4pVMmJ9+O6cIzcRJp9Ajv7JF5esnEE4QjOpEHLKJCIMhoVOPW?=
 =?us-ascii?Q?tqbOAtzzlEdfqWowFNqmGCWwPRYzKVZB8bNJbm0AjRiFl+nJF4YepT6vujm/?=
 =?us-ascii?Q?Noi+xu4BofsdNSjMXRU36KqAxMBj13C25jGc3z4iAUX5cRxPvWvCjHcLwNqV?=
 =?us-ascii?Q?9taa9iichIq1QjNAqrttQqpHZUsp8/6D+Re4KZ2qp8Py9uapRhAChJhmVHI6?=
 =?us-ascii?Q?V+tXNhRVvHfJFS9V8TLXCHyoiC81zwQQgxDAMuIoxY/OltV8uKZmXO9q3mOG?=
 =?us-ascii?Q?93/xMTuUirnlGjbRwUyAda8OWsoS/JnBH2XduL4pqOSb50n7BLQGyUzkm53j?=
 =?us-ascii?Q?kvMn+uCTHakZF5Vcof9Ksk1gUrpUcypY2Ufl65YrcjzTRYbpaSnLII1K3UfY?=
 =?us-ascii?Q?B+Pfa7UyNKuojlDdzG8MvjgF8VYFoPV0WoG7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ivO+vAU1FRH5sPg14KidLd+u/cV9/mvnmsz962hVHRWOWSMWnnzvwZyXq1pd?=
 =?us-ascii?Q?oWabywoIVKpD3TfPpiBvNcpbk4MbigxdIKnf5Yx8wKHZG9L5TZZbuPkrZ6Iv?=
 =?us-ascii?Q?+MvGxGeisQA5iyVlYC0Oj5QdsATEbbd5+bdTXPUrYG9G2TFZsZDX2D68tzVl?=
 =?us-ascii?Q?1zDafdaIBmIv2cH2IUYwpXGamN2WohT1gH5l3b/Ve8y41R3maR4oiYLnDOBb?=
 =?us-ascii?Q?gwJS88s3SIknQxDbxRaWJK5sjeTab8gDraroKFax7BCZORLBJCRsXgpKYf7B?=
 =?us-ascii?Q?3JnBXfUuwd5ATx7ACAmL4pl2DLLTE/LP2cI+A2WXMb2FDstXd3KjsgtOXJcM?=
 =?us-ascii?Q?2kQ+sQ6jT47Z/DZeqV8L/oadKRnA/WLMrsTerILFHFZYf1U8hhiAcF3m356E?=
 =?us-ascii?Q?sj8ppGrtVEcq50QtmM8qvwi5YNlIWX1qng5vmd6+YnDls1fyPWbOjPvBCdl0?=
 =?us-ascii?Q?1QGWQKQo6Trr4zdCDA+UVb7CDwkmXHM6SyDxeCR0hGi4IzggwVzxm/mU5F9Z?=
 =?us-ascii?Q?KGKfVAlWLpPvAcgHg9+LZzHmztFHkj10weiDcwVfuVk39DSYtD51mJSQA13j?=
 =?us-ascii?Q?sj8XZ0T8m7UU7JLzWsW12UhEddmrHqgXDrzo3cErsX5b+DiT9644TpddALL+?=
 =?us-ascii?Q?o34Z2SSoAZL+NdO9aNDGauDj+6jFSjFSPvIaTcaF5lTrNDniDzCamw3fYJ7F?=
 =?us-ascii?Q?2AYTq0RE0QkK0O5vL07fXGi4nyK8yFcT5hGYH0l7ceFCasEsWSAuzV1p1I9Q?=
 =?us-ascii?Q?rfhI0mPh9TX5zQfBGZoku7yFve5cUgyBQtM46Be0pEc03oTTUXwQZpYtu0Pi?=
 =?us-ascii?Q?+zWxbF1o4LiUExr/66q5waBiVtgKz8uG2UlkiE0Kh9CiJ5a2F6aP9gbqFl3d?=
 =?us-ascii?Q?mgJw85kVAPD4gcUmmxlPe+TcLRUX9mLI6pwhimj8U12yeTC7B0ztCM3Xe7HA?=
 =?us-ascii?Q?lXklcGgz41xbj7I2p57ZCOa6qCf/KTqr5GzyQIzQt09z9YH0mum7+CaLfcY/?=
 =?us-ascii?Q?zeF0CI9r2RlPC8VyJ21Ug5Ldg7AJ5qwHl/xjpVnYSxXPBUshds2h1pgsHris?=
 =?us-ascii?Q?ReI59zem7RREMNK7jVxz27SEw2KYoKOvwuFuJgYtyPVHKOaWE32pHGetN86C?=
 =?us-ascii?Q?prHyxOLM7i882Bl6FZg6C9aZ+MvI05IFRfqxbZd4Knq20e/4eECsXwTUi6+U?=
 =?us-ascii?Q?UAIZC4m9NOuKD6EzcDDGMT40/EUPR0gJ/JOhNmwM1okVMMru+vWO2xH+8zpm?=
 =?us-ascii?Q?u8iqtrV6MD3jyroabzw9NxcJxJ7POkrrfnaT5zScceFNp0SGnapEFZEy8Afg?=
 =?us-ascii?Q?ejUyNS7mXbTd0nZNJwI83xunxC4yL+6bOIfrKD71DoJv3xl00/SHASC1Dnz9?=
 =?us-ascii?Q?2DDU72jwNIajV4NVsJUnM+PD8PADUhw1Eykd093HuxPFUgELKC9qaXhj+dL8?=
 =?us-ascii?Q?9VSjqxfJxTjn1RIVGG565Kdq++A7FbABAQ7yNi87qL78Z5NsdGCWgfzNSJ2A?=
 =?us-ascii?Q?m2SW9kBmLvgQSczj96nsgotvcQHkLOBNz5LQ5k3TxXaWO1W0puxnGFqw52rx?=
 =?us-ascii?Q?HlYJ7Y/2y5TgaqliafzsfY5U3dzhjOWgz2rhbeAtBdQruTYalex1lobvP3ce?=
 =?us-ascii?Q?/xQFWE4jwEC5MYbyVqFi9KYHfnuMTNlwSqay7OhgRLcnNmJ6FUPc8grKkGqS?=
 =?us-ascii?Q?+rsV6IHVXfwIptKciW7cOlhLYDykKuDH1hl1DAs8H9siQaD+cQ66qNM4nLVg?=
 =?us-ascii?Q?PiIQifhWhQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bd59bb-9bcc-451d-c69b-08de51f43c07
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:04:15.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SspSdoyCFnhFyx/kDDQ6S0ZEdcGS3q97MpJBf0hAcE+4z9f+wRnDLQPPkkYSSx3BhahsNbfUTtRQE4S3Nz2xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11424
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_080424_226647_08E097D9 
X-CRM114-Status: GOOD (  34.82  )
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

On Fri, Jan 09, 2026 at 01:42:06PM +0200, Adrian Hunter wrote:
> On 08/01/2026 17:09, Frank Li wrote:
> > On Thu, Jan 08, 2026 at 10:05:56AM +0200, Adrian Hunter wrote:
> >> Master drivers currently manage Runtime PM individually, but all require
> >> runtime resume for bus operations.  This can be centralized in common code.
> >>
> >> Add optional Runtime PM support to ensure the parent device is runtime
> >> resumed before bus operations and auto-suspended afterward.
> >>
> >> Notably, do not call ->bus_cleanup() if runtime resume fails.  Master
> >> drivers that opt-in to core runtime PM support must take that into account.
> >>
> >> Also provide an option to allow IBIs and hot-joins while runtime suspended.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>
> >>
> >> Changes in V2:
> >>
> >> 	None
> >>
> >> 	Frank suggested dispensing with rpm_allowed.  That would be OK for
> >> 	drivers that do not enable runtime PM, but the drivers that do
> >> 	enable runtime PM (i.e. dw-i3c-master.c	and svc-i3c-master.c) might
> >> 	be affected.  rpm_allowed can be removed when they are converted to
> >> 	the new approach.
> >>
> >>
> >>  drivers/i3c/device.c       | 46 +++++++++++++++++--
> >>  drivers/i3c/internals.h    |  4 ++
> >>  drivers/i3c/master.c       | 93 +++++++++++++++++++++++++++++++++++---
> >>  include/linux/i3c/master.h |  4 ++
> >>  4 files changed, 138 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> >> index 8a156f5ad692..101eaa77de68 100644
> >> --- a/drivers/i3c/device.c
> >> +++ b/drivers/i3c/device.c
> >> @@ -46,10 +46,16 @@ int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
> >>  			return -EINVAL;
> >>  	}
> >>
> >> +	ret = i3c_bus_rpm_get(dev->bus);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >
> > Can you similar method
> >
> > commit ef8057b07c72a817537856b98d6e7493b9404eaf
> > Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Date:   Thu Nov 13 20:33:33 2025 +0100
> >
> >     PM: runtime: Wrapper macros for ACQUIRE()/ACQUIRE_ERR()
> >
> >     Add wrapper macros for ACQUIRE()/ACQUIRE_ERR() and runtime PM
> >     usage counter guards introduced recently: pm_runtime_active_try,
> >     pm_runtime_active_auto_try, pm_runtime_active_try_enabled, and
> >     pm_runtime_active_auto_try_enabled.
> >
> >     The new macros should be more straightforward to use.
> >
> >     For example, they can be used for rewriting a piece of code like below:
> >
> >             ACQUIRE(pm_runtime_active_try, pm)(dev);
> >             if ((ret = ACQUIRE_ERR(pm_runtime_active_try, &pm)))
> >                     return ret;
>
> In this case there is little benefit, and it introduces some
> ugliness.
>
> PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND() cannot be used
> because the runtime pm is conditional on master->rpm_allowed.
>
> New guard definitions could be added e.g.
>
>   static void i3c_master_rpm(struct i3c_master_controller *master)
>   {
> 	BUG();
>   }
>
>   DEFINE_GUARD(i3c_master_rpm_active, struct i3c_master_controller *, i3c_master_rpm(_T), i3c_master_rpm_put(_T))
>   DEFINE_GUARD_COND(i3c_master_rpm_active, _auto, i3c_master_rpm_get(_T))
>
> And then used like:
>
> -       ret = i3c_master_rpm_get(master);
> -       if (ret)
> +       ACQUIRE(i3c_master_rpm_active_auto, pm)(master);
> +       if ((ret = ACQUIRE_ERR(i3c_master_rpm_active_auto, &pm)))
>                 return ret;
>
> But the result is ugly and there is only one place that it
> simplifies the error path, and then only slightly:

Okay, make sense.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  int i3c_master_do_daa(struct i3c_master_controller *master)
>  {
>  	int ret;
>
> -	ret = i3c_master_rpm_get(master);
> -	if (ret)
> +	ACQUIRE(i3c_master_rpm_active_auto, pm)(master);
> +	if ((ret = ACQUIRE_ERR(i3c_master_rpm_active_auto, &pm)))
>  		return ret;
>
>  	i3c_bus_maintenance_lock(&master->bus);
>  	ret = master->ops->do_daa(master);
>  	i3c_bus_maintenance_unlock(&master->bus);
>
>  	if (ret)
> -		goto out;
> +		return ret;
>
>  	i3c_bus_normaluse_lock(&master->bus);
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
> -out:
> -	i3c_master_rpm_put(master);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
> >
> > Frank
> >
> >>  	i3c_bus_normaluse_lock(dev->bus);
> >>  	ret = i3c_dev_do_xfers_locked(dev->desc, xfers, nxfers, mode);
> >>  	i3c_bus_normaluse_unlock(dev->bus);
> >>
> >> +	i3c_bus_rpm_put(dev->bus);
> >> +
> >>  	return ret;
> >>  }
> >>  EXPORT_SYMBOL_GPL(i3c_device_do_xfers);
> >> @@ -66,10 +72,16 @@ int i3c_device_do_setdasa(struct i3c_device *dev)
> >>  {
> >>  	int ret;
> >>
> >> +	ret = i3c_bus_rpm_get(dev->bus);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	i3c_bus_normaluse_lock(dev->bus);
> >>  	ret = i3c_dev_setdasa_locked(dev->desc);
> >>  	i3c_bus_normaluse_unlock(dev->bus);
> >>
> >> +	i3c_bus_rpm_put(dev->bus);
> >> +
> >>  	return ret;
> >>  }
> >>  EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
> >> @@ -106,16 +118,27 @@ EXPORT_SYMBOL_GPL(i3c_device_get_info);
> >>   */
> >>  int i3c_device_disable_ibi(struct i3c_device *dev)
> >>  {
> >> -	int ret = -ENOENT;
> >> +	int ret;
> >> +
> >> +	if (i3c_bus_rpm_ibi_allowed(dev->bus)) {
> >> +		ret = i3c_bus_rpm_get(dev->bus);
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >>
> >>  	i3c_bus_normaluse_lock(dev->bus);
> >>  	if (dev->desc) {
> >>  		mutex_lock(&dev->desc->ibi_lock);
> >>  		ret = i3c_dev_disable_ibi_locked(dev->desc);
> >>  		mutex_unlock(&dev->desc->ibi_lock);
> >> +	} else {
> >> +		ret = -ENOENT;
> >>  	}
> >>  	i3c_bus_normaluse_unlock(dev->bus);
> >>
> >> +	if (!ret || i3c_bus_rpm_ibi_allowed(dev->bus))
> >> +		i3c_bus_rpm_put(dev->bus);
> >> +
> >>  	return ret;
> >>  }
> >>  EXPORT_SYMBOL_GPL(i3c_device_disable_ibi);
> >> @@ -135,16 +158,25 @@ EXPORT_SYMBOL_GPL(i3c_device_disable_ibi);
> >>   */
> >>  int i3c_device_enable_ibi(struct i3c_device *dev)
> >>  {
> >> -	int ret = -ENOENT;
> >> +	int ret;
> >> +
> >> +	ret = i3c_bus_rpm_get(dev->bus);
> >> +	if (ret)
> >> +		return ret;
> >>
> >>  	i3c_bus_normaluse_lock(dev->bus);
> >>  	if (dev->desc) {
> >>  		mutex_lock(&dev->desc->ibi_lock);
> >>  		ret = i3c_dev_enable_ibi_locked(dev->desc);
> >>  		mutex_unlock(&dev->desc->ibi_lock);
> >> +	} else {
> >> +		ret = -ENOENT;
> >>  	}
> >>  	i3c_bus_normaluse_unlock(dev->bus);
> >>
> >> +	if (ret || i3c_bus_rpm_ibi_allowed(dev->bus))
> >> +		i3c_bus_rpm_put(dev->bus);
> >> +
> >>  	return ret;
> >>  }
> >>  EXPORT_SYMBOL_GPL(i3c_device_enable_ibi);
> >> @@ -163,19 +195,27 @@ EXPORT_SYMBOL_GPL(i3c_device_enable_ibi);
> >>  int i3c_device_request_ibi(struct i3c_device *dev,
> >>  			   const struct i3c_ibi_setup *req)
> >>  {
> >> -	int ret = -ENOENT;
> >> +	int ret;
> >>
> >>  	if (!req->handler || !req->num_slots)
> >>  		return -EINVAL;
> >>
> >> +	ret = i3c_bus_rpm_get(dev->bus);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	i3c_bus_normaluse_lock(dev->bus);
> >>  	if (dev->desc) {
> >>  		mutex_lock(&dev->desc->ibi_lock);
> >>  		ret = i3c_dev_request_ibi_locked(dev->desc, req);
> >>  		mutex_unlock(&dev->desc->ibi_lock);
> >> +	} else {
> >> +		ret = -ENOENT;
> >>  	}
> >>  	i3c_bus_normaluse_unlock(dev->bus);
> >>
> >> +	i3c_bus_rpm_put(dev->bus);
> >> +
> >>  	return ret;
> >>  }
> >>  EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
> >> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> >> index f609e5098137..0f1f3f766623 100644
> >> --- a/drivers/i3c/internals.h
> >> +++ b/drivers/i3c/internals.h
> >> @@ -11,6 +11,10 @@
> >>  #include <linux/i3c/master.h>
> >>  #include <linux/io.h>
> >>
> >> +int __must_check i3c_bus_rpm_get(struct i3c_bus *bus);
> >> +void i3c_bus_rpm_put(struct i3c_bus *bus);
> >> +bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
> >> +
> >>  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
> >>  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> >>
> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >> index ff6cbc044787..594d61edcef4 100644
> >> --- a/drivers/i3c/master.c
> >> +++ b/drivers/i3c/master.c
> >> @@ -106,6 +106,38 @@ static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
> >>  	return container_of(dev, struct i3c_master_controller, dev);
> >>  }
> >>
> >> +static int __must_check i3c_master_rpm_get(struct i3c_master_controller *master)
> >> +{
> >> +	int ret = master->rpm_allowed ? pm_runtime_resume_and_get(master->dev.parent) : 0;
> >> +
> >> +	if (ret < 0) {
> >> +		dev_err(master->dev.parent, "runtime resume failed, error %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +	return 0;
> >> +}
> >> +
> >> +static void i3c_master_rpm_put(struct i3c_master_controller *master)
> >> +{
> >> +	if (master->rpm_allowed)
> >> +		pm_runtime_put_autosuspend(master->dev.parent);
> >> +}
> >> +
> >> +int i3c_bus_rpm_get(struct i3c_bus *bus)
> >> +{
> >> +	return i3c_master_rpm_get(i3c_bus_to_i3c_master(bus));
> >> +}
> >> +
> >> +void i3c_bus_rpm_put(struct i3c_bus *bus)
> >> +{
> >> +	i3c_master_rpm_put(i3c_bus_to_i3c_master(bus));
> >> +}
> >> +
> >> +bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus)
> >> +{
> >> +	return i3c_bus_to_i3c_master(bus)->rpm_ibi_allowed;
> >> +}
> >> +
> >>  static const struct device_type i3c_device_type;
> >>
> >>  static struct i3c_bus *dev_to_i3cbus(struct device *dev)
> >> @@ -611,6 +643,12 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
> >>  	if (!master->ops->enable_hotjoin || !master->ops->disable_hotjoin)
> >>  		return -EINVAL;
> >>
> >> +	if (enable || master->rpm_ibi_allowed) {
> >> +		ret = i3c_master_rpm_get(master);
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >>  	i3c_bus_normaluse_lock(&master->bus);
> >>
> >>  	if (enable)
> >> @@ -623,6 +661,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
> >>
> >>  	i3c_bus_normaluse_unlock(&master->bus);
> >>
> >> +	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
> >> +		i3c_master_rpm_put(master);
> >> +
> >>  	return ret;
> >>  }
> >>
> >> @@ -1712,18 +1753,23 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
> >>  {
> >>  	int ret;
> >>
> >> +	ret = i3c_master_rpm_get(master);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	i3c_bus_maintenance_lock(&master->bus);
> >>  	ret = master->ops->do_daa(master);
> >>  	i3c_bus_maintenance_unlock(&master->bus);
> >>
> >>  	if (ret)
> >> -		return ret;
> >> +		goto out;
> >>
> >>  	i3c_bus_normaluse_lock(&master->bus);
> >>  	i3c_master_register_new_i3c_devs(master);
> >>  	i3c_bus_normaluse_unlock(&master->bus);
> >> -
> >> -	return 0;
> >> +out:
> >> +	i3c_master_rpm_put(master);
> >> +	return ret;
> >>  }
> >>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
> >>
> >> @@ -2065,8 +2111,17 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >>
> >>  static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
> >>  {
> >> -	if (master->ops->bus_cleanup)
> >> -		master->ops->bus_cleanup(master);
> >> +	if (master->ops->bus_cleanup) {
> >> +		int ret = i3c_master_rpm_get(master);
> >> +
> >> +		if (ret) {
> >> +			dev_err(&master->dev,
> >> +				"runtime resume error: master bus_cleanup() not done\n");
> >> +		} else {
> >> +			master->ops->bus_cleanup(master);
> >> +			i3c_master_rpm_put(master);
> >> +		}
> >> +	}
> >>
> >>  	i3c_master_detach_free_devs(master);
> >>  }
> >> @@ -2421,6 +2476,10 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
> >>  			return -EOPNOTSUPP;
> >>  	}
> >>
> >> +	ret = i3c_master_rpm_get(master);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	i3c_bus_normaluse_lock(&master->bus);
> >>  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
> >>  	if (!dev)
> >> @@ -2429,6 +2488,8 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
> >>  		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
> >>  	i3c_bus_normaluse_unlock(&master->bus);
> >>
> >> +	i3c_master_rpm_put(master);
> >> +
> >>  	return ret ? ret : nxfers;
> >>  }
> >>
> >> @@ -2531,6 +2592,10 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
> >>
> >>  	master = i2c_adapter_to_i3c_master(adap);
> >>
> >> +	ret = i3c_master_rpm_get(master);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	i3c_bus_maintenance_lock(&master->bus);
> >>  	switch (action) {
> >>  	case BUS_NOTIFY_ADD_DEVICE:
> >> @@ -2544,6 +2609,8 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
> >>  	}
> >>  	i3c_bus_maintenance_unlock(&master->bus);
> >>
> >> +	i3c_master_rpm_put(master);
> >> +
> >>  	return ret;
> >>  }
> >>
> >> @@ -2881,6 +2948,10 @@ int i3c_master_register(struct i3c_master_controller *master,
> >>  	INIT_LIST_HEAD(&master->boardinfo.i2c);
> >>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
> >>
> >> +	ret = i3c_master_rpm_get(master);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	device_initialize(&master->dev);
> >>  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> >>
> >> @@ -2960,6 +3031,8 @@ int i3c_master_register(struct i3c_master_controller *master,
> >>  	i3c_master_register_new_i3c_devs(master);
> >>  	i3c_bus_normaluse_unlock(&master->bus);
> >>
> >> +	i3c_master_rpm_put(master);
> >> +
> >>  	return 0;
> >>
> >>  err_del_dev:
> >> @@ -2969,6 +3042,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> >>  	i3c_master_bus_cleanup(master);
> >>
> >>  err_put_dev:
> >> +	i3c_master_rpm_put(master);
> >>  	put_device(&master->dev);
> >>
> >>  	return ret;
> >> @@ -3114,8 +3188,15 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
> >>  		return;
> >>
> >>  	if (dev->ibi->enabled) {
> >> +		int ret;
> >> +
> >>  		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
> >> -		if (i3c_dev_disable_ibi_locked(dev))
> >> +		ret = i3c_master_rpm_get(master);
> >> +		if (!ret) {
> >> +			ret = i3c_dev_disable_ibi_locked(dev);
> >> +			i3c_master_rpm_put(master);
> >> +		}
> >> +		if (ret)
> >>  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
> >>  	}
> >>
> >> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> >> index 6225ad28f210..c1ec597f655c 100644
> >> --- a/include/linux/i3c/master.h
> >> +++ b/include/linux/i3c/master.h
> >> @@ -504,6 +504,8 @@ struct i3c_master_controller_ops {
> >>   * @secondary: true if the master is a secondary master
> >>   * @init_done: true when the bus initialization is done
> >>   * @hotjoin: true if the master support hotjoin
> >> + * @rpm_allowed: true if Runtime PM allowed
> >> + * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
> >>   * @boardinfo.i3c: list of I3C  boardinfo objects
> >>   * @boardinfo.i2c: list of I2C boardinfo objects
> >>   * @boardinfo: board-level information attached to devices connected on the bus
> >> @@ -527,6 +529,8 @@ struct i3c_master_controller {
> >>  	unsigned int secondary : 1;
> >>  	unsigned int init_done : 1;
> >>  	unsigned int hotjoin: 1;
> >> +	unsigned int rpm_allowed: 1;
> >> +	unsigned int rpm_ibi_allowed: 1;
> >>  	struct {
> >>  		struct list_head i3c;
> >>  		struct list_head i2c;
> >> --
> >> 2.51.0
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
