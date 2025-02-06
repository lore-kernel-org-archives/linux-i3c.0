Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE485C02198
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Feb 2025 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+1phjNhE3dsrJ2li3UriZ859nCCLXo/DejvuIo1qUs=; b=U2CXpXPQWRLCeX
	MkE97w4I5Y/VIqMj8F5zJj5Pq/xT42XcmiiN5pupwPUnZfpu4tl0yj4RaRHsnYtcPDJNGa5qgc+or
	5lSTOgkNwiMjnAAak19T/Bqsc0YkW7EjcmhWA3BVYCd82l1WokFaA9jgMeVNxRvY+IyYOyTGZaXAy
	3+HIJKSD9TqlhgSHTYpTngEEvOfgplPzIDAu0S4MdhxHjEK3j7uVCeyNjgrPzQo6qQ5yTqT46cSao
	WHaKyNn0ZGGGOWzBcBF0ZX+XtbIOwc5eXZqBJTEcVFRLk097oG2K+xnrHNBVcMYmZOCUKFNifsSym
	YX3EbI9JpCJkG8wLkabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4ZH-00000006pAE-2mGx;
	Thu, 06 Feb 2025 16:17:31 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4EF-00000006m09-2Spa
	for linux-i3c@lists.infradead.org;
	Thu, 06 Feb 2025 15:55:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egavKuj5nu80WAg9FoQ1X2ClO2RYtWbkMEztsErFvZj9f4PJA044urBc46tSzEi5hIsoKr2FUZLrBOSEvXEf5zFylSY4V7+c08YtIoflcHKMMWqvkgkvSL44VEs5skq2P2rzJqpqiHqxgCZCjYJ8clLYE/hJy11E6S4lmnh+jhLEZ5O7eKN8haIMth7Y8HgFse8KooVXb47zigYHRFS7LWIW6gikLxFy9jfnR94HVJS8yIOunsfkBbZ8key/q/rTWJCMEowZZQSbVUckFrPWFBnAbiNPVmPvdUV6wuJdSY/aD0nUGSOKPzHmeeWyNTdakA0wGlfjvDV9+NCQV2MGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI1QqbK/wbSqqR84BMNYYiCMHKJEIhkhijZ1wrcF5gc=;
 b=JzAXbN6zewsu7A/XtSHnmSdDnPE4IXuCb/JHg/rSDnFtRrOQkcGRaWqJ5DWGskD0zdf75Y1tcQ0x42KEbd9dPU9UCX4v+1NioAWSaPNbW+Kd7bFtFj0glp7cANuxMJpVDf26UP3YYYWReZBP7iCVBvtodqi+zT96x1bjAkefres65EGqP17JebGwcjDZVq3Xve8WyPErMpUiKJ+snWcJ9i6IoaYX2AdXjg1fNM8CKW7+SxANGRQwwuepjSUgubTxplajeY+M3QqF7kE2RzkogTKVUp+cUbz+/ERlAPS6SoQ2J9yB+gtK+e2WyoYHJY5iue2p3E5KNYbDsGXXr2IjHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PI1QqbK/wbSqqR84BMNYYiCMHKJEIhkhijZ1wrcF5gc=;
 b=oU9+U/S3OEXzliXpq5+y5crYEBSF6WRRoPlUGgL+84ibuVLhwX4sydZNBx7ksnflL27GhiO5yoxn7t1h3j8E1IozfABMCoLPPRzMrLyVB/639IoTCE6o+YrCFHmx7hpKycSQvUP4Mw6H4ocSiMAjufW+GLXTIr+4TiGrlYuxCz7DecFEYggo86Te+Od4jADgpbDdSz/+++LVy41pjbvpXw18uK4LNRX2BuPFvcZ2ewcJtbcfN2yc8PRJcA8jD7RKY9TkL14K/+TPNWrc9lXFvbP/wk83iMH12ezu/jhWqw4Twb6FzhyMewaKfwsfvKVMWjeyrRrhIiZOMRXep0Dq4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8667.eurprd04.prod.outlook.com (2603:10a6:20b:43e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 15:55:40 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 15:55:40 +0000
Date: Thu, 6 Feb 2025 10:55:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
Message-ID: <Z6TbcyCGA17BRe+5@lizhi-Precision-Tower-5810>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
 <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
 <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
 <Z6DmUIKn5usytjl3@lizhi-Precision-Tower-5810>
 <928b69ef-e5fa-46ea-9075-2b12d7fd9372@starfivetech.com>
 <Z6I0kSaNIHvRh60Y@lizhi-Precision-Tower-5810>
 <19ea209c-cf55-4ec4-adae-16033fc7d819@starfivetech.com>
 <Z6OKvl7DOFrXcB1A@lizhi-Precision-Tower-5810>
 <188c4405-9d52-4a97-a290-e1585fcc9285@starfivetech.com>
Content-Disposition: inline
In-Reply-To: <188c4405-9d52-4a97-a290-e1585fcc9285@starfivetech.com>
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 238e15b6-e3e9-44ec-a648-08dd46c6b456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?o71XYZKrmE9HtDDI/XXv4i0zm7iPv3yYWTeZaYwl/Bp/gq8N3QQGRhmfPp?=
 =?iso-8859-1?Q?X388nlmKEVfMx3GiR3qq3c+8xzU4SPiman3UmOUPZrJOdvj+E1h8c3YYQH?=
 =?iso-8859-1?Q?0N2mKzaWldgjoNHsuzw9+auiCrDvGdmLpwYf9Z9pSW1jMwr5x+YCeLXvzg?=
 =?iso-8859-1?Q?9bHPjig+mjfmPJBQI6MQ/iG5v5OVkx4XEluYL7i2XSNK1ZG3CO3RrqSyB3?=
 =?iso-8859-1?Q?1q8ZDOIMg70AzDZ8Z/XhkR6DtRNqwgoq4GK69d16cSFNCawDTd1SsHpx4N?=
 =?iso-8859-1?Q?aSYmOyowEu+vNrzLfS0iD8eYAdUOFESwMn1FLMYY+BsUqZ0D4jqGYoWeei?=
 =?iso-8859-1?Q?S5yhmqX6K5XQ4tlqYjzpTf8yeeKlSx2CITbqDSF+RMK/FDDkB6KFlvFUhr?=
 =?iso-8859-1?Q?2Tc+jczRWhrBjfv7sSUZMPovEx7mLa5P/QQ4gRIK6GWLsbzerE7gMMK69H?=
 =?iso-8859-1?Q?1BvTkidwabM/CZx2QwaX0NJ9TXfADhbX22B4aFOxlI1MB5oS4AZWKeuQEv?=
 =?iso-8859-1?Q?8988oor8pOSAtAiKzN5JgApSU2L2VDAOGzQDEP6KGZISpoRLu3mAJMRND6?=
 =?iso-8859-1?Q?4IN9WiNc7iE6MbOJq5lF0kIzaYsHh2KGNuOzjBTjxUoY8BU4kAPgPo0STw?=
 =?iso-8859-1?Q?Fwh6CEZLSw3gRsQIFg/U1B4fUitspwV9EtGeQbpPzcT4sqUOi7CgGfwdeV?=
 =?iso-8859-1?Q?ZdrB9mOyQucYDwI6jiDIQyF3x3aTUzK9RoaVHGkUnNWZsgMxGs8x3TyU6Z?=
 =?iso-8859-1?Q?8wf0GxcS9JWXic3bX417VWGTzMLhgo4q6sRP/rWuucvJ9mWv0R5NLNGiOK?=
 =?iso-8859-1?Q?YKfDVmJy502QGmJ8viYp+Edk3fIYATTcj+0NkWz/4yvzlRz60l/qJKaWy+?=
 =?iso-8859-1?Q?bqbrv2+sSGs06KGSvvAVGlpFGHOQMGcCn73nK//CtrPIbBcir56RB2jNNr?=
 =?iso-8859-1?Q?4X6RtWxXnsngheOj+DUHrZHYb/WpDCq3NgTWP6jLy0wDs+iOuy+FA/OisX?=
 =?iso-8859-1?Q?kMqsvhB6E6l1IvdjN3aI0AXToMLWJaRRY51vEeE+/3PafgZETbGqJANMMx?=
 =?iso-8859-1?Q?aP9DSCgaEnRuB2qe9A0LL15MWGisVPx/F5N8Xs+pFdK8F19rK8whMs2Vax?=
 =?iso-8859-1?Q?Nm/y048Civbu6Hm0hA2MD0la7Y4dzZEH8GZ6Vv6w75ejVW6425rvJDzutH?=
 =?iso-8859-1?Q?GqTjbh/gZFThqIddyqAVir0knZpNnTBFQRRF5YXJxnKq71mZ37oApdmqrG?=
 =?iso-8859-1?Q?LMUIGGXEiRxgq4Kyrd1KAMNMPw6NgBXXVvKpwiMNCQ2aCBhZVzuFQgXAKR?=
 =?iso-8859-1?Q?XERqB8twhoeTcyQ+kpKh1wqkqORYBTweOy7PNPn3VqjxdUeD+WgogAtuJP?=
 =?iso-8859-1?Q?z5ao0pcG1CKN2ld4wNaGMT6gqKn6swerKH2ML68NZ23pLvc0c6ENGcBY6n?=
 =?iso-8859-1?Q?OqodhijchsPIT4g8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G+o7bdy7jbSb+8Bq/M/9tItzyLYcujeMsHwvgJRWJqbmhIFJqZ0Dd4UlB7?=
 =?iso-8859-1?Q?QEFZVH55tAUrYzW34rP/xjT7vGatxasuUuePM2KVvB8pOSkTVffU8czf8s?=
 =?iso-8859-1?Q?Wi9YhREkiFBLe1NwpVuURavCNIh1B+DWyOAmwHQ/Mqp6NN6gvGZpxsF8ta?=
 =?iso-8859-1?Q?MJmXSAnYXezMODWzVpbiJ7Hyeyx6SWyEhnfOpY+Zs+LI+Ohd0eJpH49rkh?=
 =?iso-8859-1?Q?3LUiycBEoCOp8v8ME5wUmo2L7IbNdrkSjR5vuTpQvZMf0nVpUWfR5qSdgp?=
 =?iso-8859-1?Q?C0Moa79G0a3P49oJYuS3ogapfSYa7yv3n4uZl05YBJlQv7HZtFwfI4+/Me?=
 =?iso-8859-1?Q?OYzzQGttlpPvzdj4Cn6L0RqcgXIzHRia94BGjFSaK1FCQESdXvzBijN3pe?=
 =?iso-8859-1?Q?3vnjLr5UrXR3bVhwTj0ngy6Gq61jgjkgiuN28Oz0HoP7bRhZlDc4iQaAOQ?=
 =?iso-8859-1?Q?xxt7MS1ZpJkRltnSTvz9WRx9Qa7rFvN0G5pRqXwoAoz3vQHDJJE7PviEt4?=
 =?iso-8859-1?Q?O189TlhicuBOs0Ty9byvtCoEeXNpPlPAW/EW6Xlg85wF89SUo6yIyO8SuO?=
 =?iso-8859-1?Q?xyV6Hi32vTJNJdzD//daiFkO0ucT7jovQlaomKFTnAGqUQFF7OahRWf0F6?=
 =?iso-8859-1?Q?9Lj4lB7ZKIvhb0P9i2/USpPQ3CXhPMN1noHsVJiOf5YjnPfNqXttq33Hwg?=
 =?iso-8859-1?Q?XiX1+8UxH91V13+6u1EplE77cjwlmRNfNiI6PJhcapbv3wYXFeItVNvcZ2?=
 =?iso-8859-1?Q?lIkPuvLMCuGy5CpwcIYfGhYRLvKtFzHvpKZUQ9UscpVJwYIa3a4jTKEvsd?=
 =?iso-8859-1?Q?4FekEtLzPC9kOlKZxIiPETPcrfk9pAxt7DgHXk9gI2nB4CWpIEyOeTbcnw?=
 =?iso-8859-1?Q?GRbtxlGOOonIOS3ooc9RSaQQBGPPYMMEtQ/zu8+mWWqSL/WR9OWbC77Fz9?=
 =?iso-8859-1?Q?OH7zwFmhfv9BMJdti+f4vaOCDMtbU4I7R6NnN45+2yTk5u+bbcFEwiwX1G?=
 =?iso-8859-1?Q?5SHbhP6J/MhhcdFES4LQ0KTvrKH18IPPEFti6y2LBh11wFAe4W3mjPQktx?=
 =?iso-8859-1?Q?5sCZ8sYqvf99uQX3mw8McM2TE1HkptCKxjDTvYmshEx1ryd8XmhTywMCLh?=
 =?iso-8859-1?Q?f9juVrVweG82YG7v3tGlS8DnWdO5rpVU34pxhUTIpeGxYx0Zj2/R+/Xqpv?=
 =?iso-8859-1?Q?IK+KWifC5F2PaYgusHH0byaA26BUAC1tjjsqHQ/U9qIEDkD6Hm5GZBvORH?=
 =?iso-8859-1?Q?70farOxko1LpDZ5kWOOKiLnGdMXsUcKXBb9jIbP93RBBHhttOQMjo/Q97Y?=
 =?iso-8859-1?Q?CXsMT/3GLJ1HZjevValv6E6RPs7SRidcbMX00waGZ+r/bKt5I8iBpA9xBY?=
 =?iso-8859-1?Q?7pDrzFgspDKKK3/YCAfDJz0vYAzalK6W3+LxhxoD/EIRmsL7JbC705K44x?=
 =?iso-8859-1?Q?dtb2BZl/13E0XrqbYfsr0qn++I+QWXa7JYgSmDYEvBBIyXkwo6yon9UK0/?=
 =?iso-8859-1?Q?kR8ZAoxZ+ixBO73p2ZPHQTibHVK7ieo07PtB6eD+hNzW4SqFY8FY1Z/IYE?=
 =?iso-8859-1?Q?DfxYLqcBM068tK/N7m4s2NuKz/oN3oeg52TcEaMZK/dDlDc51h3sxyS+t+?=
 =?iso-8859-1?Q?Loi8Q/uFtxt5y4/w5/U6P2Ku1CJxMsXP4m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238e15b6-e3e9-44ec-a648-08dd46c6b456
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:55:40.0885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUGqhw53j3QBlP65mYXKTtuQP2yKmsCsnjT/Yg0DoQcnJ6eUjTa2PibkND7I6KjqyhnE2oohMCjDPmuNe99YVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_075547_783259_73EDD98A 
X-CRM114-Status: GOOD (  45.93  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Feb 06, 2025 at 07:05:03AM +0000, Joshua Yeong wrote:
> On 05-Feb-2025 11:58 PM, Frank Li wrote:
> > On Wed, Feb 05, 2025 at 06:30:49AM +0000, Joshua Yeong wrote:
> >> On 04-Feb-2025 11:38 PM, Frank Li wrote:
> >>> On Tue, Feb 04, 2025 at 03:17:36AM +0000, Joshua Yeong wrote:
> >>>> Hi Frank,
> >>>>
> >>>> On 03-Feb-2025 11:52 PM, Frank Li wrote:
> >>>>> On Mon, Feb 03, 2025 at 02:32:51AM +0000, Joshua Yeong wrote:
> >>>>>> Hi Mukesh and Frank,
> >>>>>>
> >>>>>> On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
> >>>>>>> Hi Frank,
> >>>>>>>
> >>>>>>> On 1/30/2025 1:35 AM, Frank Li wrote:
> >>>>>>>> I3C HDR requires enter/exit patterns during each I3C transfer. A=
dd a new
> >>>>>>>> API i3c_device_do_priv_xfers_mode(). The existing
> >>>>>>>> i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mo=
de(I3C_SDR)
> >>>>>>>> to maintain backward compatibility.
> >>>>>>>>
> >>>>>>>> Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anon=
ymous union
> >>>>>>>> with 'rnw' since HDR mode relies on read/write commands instead =
of the
> >>>>>>>> 'rnw' bit in the address as in SDR mode.
> >>>>>>>>
> >>>>>>>> Add a priv_xfers_mode callback for I3C master drivers. If priv_x=
fers_mode
> >>>>>>>> is not implemented, fallback to SDR mode using the existing priv=
_xfers
> >>>>>>>> callback.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >>>>>>>> ---
> >>>>>>>> Why not add hdr mode in struct i3c_priv_xfer because mode can't =
be mixed in
> >>>>>>>> one i3c transfer. for example, can't send a HDR follow one SDR b=
etween
> >>>>>>>> START and STOP.
> >>>>>>>>
> >>>>>>> Is it wise to add two function inside main funcion and separate S=
DR vs HDR ? so we don't need to change current function arguments.
> >>>>>
> >>>>> I am not sure if understand your means. HDR have difference mode, a=
nyway
> >>>>> need add new argument.
> >>>>>
> >>>>>>
> >>>>>> I think the 'private transfers' are limited to SDR communications,
> >>>>>> would it be better if we have a different interface/naming for hdr=
 transfers?
> >>>>>
> >>>>> The key is what's difference between hdr and private transfers. So =
far only
> >>>>> command vs rnw, any other differences I missed?
> >>>>
> >>>> I guess mainly the terminology. The specification differentiate HDR =
from private transfer.
> >>>> We can have the hdr interface to have length indicating for u16 rath=
er than u8 in private trasnfer.
> >>>
> >>> It should be equivalence with check length is even.
> >>>
> >>> The key is how client driver will easy to use HDR if they already hav=
e SDR
> >>> support.
> >>>
> >>> suppose client:
> >>>
> >>> struct i3c_priv_xfer xfer[2] =3D {{ .rnw =3D 0, buf=3Dp1, size =3D 4,=
 addr=3D0xb },
> >>> 				{ .rnw =3D 1, buf=3Dp2, size =3D 4, addr=3D0xb }}
> >>>
> >>> priv_xfer(..., xfer, 2};
> >>>
> >>> if support HDR
> >>>
> >>> if (hdr) {
> >>> 	xfer[0].cmd =3D 0x80;
> >>> 	xfer[1].cmd =3D 0x;
> >>> 	priv_xfer(..., xfer, 2, HDR);
> >>> } else {
> >>> 	priv_xfer(..., xfer, 2, SDR);
> >>> }
> >>>
> >>> client driver needn't distingiush if buff is u8* or u16*.
> >>>
> >>
> >> I fine with the overall structure `.rnw`, `buf`, `size` and `addr`.
> >>
> >> I prefer if we could use `hdr_xfer` rather than `priv_xfer` for HDR tr=
ansfer and we can have
> >> distinguish mode for DDR/TSP/TSL/BT. In case we are supporting for ML =
in the future
> >
> > what's means of "ML"?
> >
> >> we dont have to lump the function into `priv_xfer`, and we can go `ml_=
xfer` instead.
> >
> > Actually, you suggest, rename 'i3c_device_do_priv_xfers_mode' to
> > 'i3c_device_ml_xfer'?
> >
>
> So there are 3 types of I3C Protocol as defined in I3C spec v1.1.1.
> Single Data Rate (SDR), High Data Rate (HDR) and Multi-lane (ML).
> I suggest to kept the existing priv_xfers for SDR transfer only.
> The MIPI I3C specification only uses private transfer for SDR.
>
> I assume not all I3C IP vendor support HDR mode, but they should at least=
 support SDR mode.
> We should have another set of API that uses `i3c_device_do_hdr_xfers`.
> `priv_xfer` should represent private transfer and the keyword private key=
word
> here are unique keyword itself should not mix up with HDR.
> Unless the I3C specs stated otherwise I dont think we should mixed up her=
e.
>
> Also interface for sdr/hdr should resolve the other ongoing discussion th=
read
> where mixing both sdr and hdr in `priv_xfer`

What's you perfer 'struct hdr_xfer'? I read spec, according to line 8703,
Just reduce scl clock number when transfer data, which should be transparent
to software.

Frank

>
> Joshua
>
> >>
> >> The issue with length indicating both u8 and u16 here is that we would=
 get confuse how the
> >> buffer length is interpreted, when length is 1 does it mean 2 bytes or=
 1 byte? Splitting HDR
> >> interface will ensure that length always indicate u16.
> >
> > All data transfers should be defined in terms of bytes or block units. =
Note
> > that QSPI DDR mode faces a similar constraint, supporting only even-len=
gth
> > transfers. In most systems, alignment requirements are used to indicate
> > size constraints:
> >
> > SDR mode: Alignment is 1 byte.
> > HDR mode: Alignment is 2 bytes.
> >
> > When using DMA without a bounce buffer, the alignment must match the ca=
che
> > line size. Changing to a u16 type does not provide enough flexibility.
> > Instead, I propose using a void* (or u8*) for the buffer and a byte cou=
nt
> > for the size. This approach allows for more extensible alignment
> > requirements and better compatibility with other transfer systems, such=
 as
> > SPI and PCIe.
> >
> > Frank
> >>
> >> Joshua
> >>
> >>
> >>>> I think the framework should check if device whether it supports HDR=
 command before sending it.
> >>>> I have code here that do some handling on that.
> >>>
> >>> Yes, I can add such check. The key point is API design.
> >>>
> >>> Frank
> >>>>
> >>>>>
> >>>>>>
> >>>>>>>> i3c_priv_xfer should be treat as whole i3c transactions. If user=
 want send
> >>>>>>>> HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() t=
wice,
> >>>>>>>> instead put into a big i3c_priv_xfer[n].
> >>>>>>>> ---
> >>>>>>>> =A0 drivers/i3c/device.c=A0=A0=A0=A0=A0=A0 | 19 +++++++++++++---=
---
> >>>>>>>> =A0 drivers/i3c/internals.h=A0=A0=A0 |=A0 2 +-
> >>>>>>>> =A0 drivers/i3c/master.c=A0=A0=A0=A0=A0=A0 |=A0 8 +++++++-
> >>>>>>>> =A0 include/linux/i3c/device.h | 12 +++++++++++-
> >>>>>>>> =A0 include/linux/i3c/master.h |=A0 3 +++
> >>>>>>>> =A0 5 files changed, 35 insertions(+), 9 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> >>>>>>>> index e80e487569146..e3db3a6a9e4f6 100644
> >>>>>>>> --- a/drivers/i3c/device.c
> >>>>>>>> +++ b/drivers/i3c/device.c
> >>>>>>>> @@ -15,12 +15,13 @@
> >>>>>>>> =A0 #include "internals.h"
> >>>>>>>> =A0 =A0 /**
> >>>>>>>> - * i3c_device_do_priv_xfers() - do I3C SDR private transfers di=
rected to a
> >>>>>>>> - *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 specific device
> >>>>>>>> + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfe=
rs directed to a
> >>>>>>>> + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
specific device
> >>>>>>>> =A0=A0 *
> >>>>>>>> =A0=A0 * @dev: device with which the transfers should be done
> >>>>>>>> =A0=A0 * @xfers: array of transfers
> >>>>>>>> =A0=A0 * @nxfers: number of transfers
> >>>>>>>> + * @mode: transfer mode
> >>>>>>>> =A0=A0 *
> >>>>>>>> =A0=A0 * Initiate one or several private SDR transfers with @dev.
> >>>>>>>> =A0=A0 *
> >>>>>>>> @@ -32,9 +33,9 @@
> >>>>>>>> =A0=A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 driver needs to resend=
 the 'xfers' some time later.
> >>>>>>>> =A0=A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 See I3C spec ver 1.1.1=
 09-Jun-2021. Section: 5.1.2.2.3.
> >>>>>>>> =A0=A0 */
> >>>>>>>> -int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >>>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_pri=
v_xfer *xfers,
> >>>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers)
> >>>>>>>> +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_=
priv_xfer *xfers,
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers,=
 enum i3c_hdr_mode mode)
> >>>>>>> why can't we pass mode as another structure member inside struct =
i3c_priv_xfer ? Adding function agrument parameter impacts existing drivers.
> >>>>>
> >>>>> If that, it will be possible, xfers[0] is sdr, xfers[1] is hdr. Act=
ually,
> >>>>> I3C can't do that.  we assume finish whole xfers between one whole =
traction
> >>>>> (between START and STOP).
> >>>>>
> >>>>> Frank
> >>>>
> >>>> Yes, I think it is better if we split xfer transfer interface for SD=
R and HDR.
> >>>> The interface should assume respective driver to decide how to handl=
e ENTHDR CCC + Exit Pattern.
> >>>> Else we will need additional 2 interface for start and stop for HDR.
> >>>>
> >>>> Joshua
> >>>>
> >>>>
> >>>>>>>> =A0 {
> >>>>>>>> =A0=A0=A0=A0=A0 int ret, i;
> >>>>>>>> =A0 @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_=
device *dev,
> >>>>>>>> =A0=A0=A0=A0=A0 }
> >>>>>>>> =A0 =A0=A0=A0=A0=A0 i3c_bus_normaluse_lock(dev->bus);
> >>>>>>>> -=A0=A0=A0 ret =3D i3c_dev_do_priv_xfers_locked(dev->desc, xfers=
, nxfers);
> >>>>>>>> +=A0=A0=A0 ret =3D i3c_dev_do_priv_xfers_locked(dev->desc, xfers=
, nxfers, mode);
> >>>>>>>> =A0=A0=A0=A0=A0 i3c_bus_normaluse_unlock(dev->bus);
> >>>>>>>> =A0 =A0=A0=A0=A0=A0 return ret;
> >>>>>>>> =A0 }
> >>>>>>>> +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
> >>>>>>>> +
> >>>>>>>> +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c=
_priv_xfer *xfers, int nxfers)
> >>>>>>>> +{
> >>>>>>>> +=A0=A0=A0 return i3c_device_do_priv_xfers_mode(dev, xfers, nxfe=
rs, I3C_SDR);
> >>>>>>>> +}
> >>>>>>>> =A0 EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
> >>>>>>>> =A0 =A0 /**
> >>>>>>>> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> >>>>>>>> index 433f6088b7cec..553edc9846ac0 100644
> >>>>>>>> --- a/drivers/i3c/internals.h
> >>>>>>>> +++ b/drivers/i3c/internals.h
> >>>>>>>> @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *=
bus);
> >>>>>>>> =A0 int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
> >>>>>>>> =A0 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3=
c_priv_xfer *xfers,
> >>>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers);
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, en=
um i3c_hdr_mode mode);
> >>>>>>>> =A0 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
> >>>>>>>> =A0 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> >>>>>>>> =A0 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> >>>>>>>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >>>>>>>> index d5dc4180afbcf..67aaba0a38db2 100644
> >>>>>>>> --- a/drivers/i3c/master.c
> >>>>>>>> +++ b/drivers/i3c/master.c
> >>>>>>>> @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_=
desc *dev)
> >>>>>>>> =A0 =A0 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *de=
v,
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3=
c_priv_xfer *xfers,
> >>>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers)
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, en=
um i3c_hdr_mode mode)
> >>>>>>>> =A0 {
> >>>>>>>> =A0=A0=A0=A0=A0 struct i3c_master_controller *master;
> >>>>>>>> =A0 @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(stru=
ct i3c_dev_desc *dev,
> >>>>>>>> =A0=A0=A0=A0=A0 if (!master || !xfers)
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> >>>>>>>> =A0 +=A0=A0=A0 if (master->ops->priv_xfers_mode)
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 return master->ops->priv_xfers_mode(dev, =
xfers, nxfers, mode);
> >>>>>>>> +
> >>>>>>>> =A0=A0=A0=A0=A0 if (!master->ops->priv_xfers)
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOTSUPP;
> >>>>>>>> =A0 +=A0=A0=A0 if (mode !=3D I3C_SDR)
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> >>>>>>>> +
> >>>>>>>> =A0=A0=A0=A0=A0 return master->ops->priv_xfers(dev, xfers, nxfer=
s);
> >>>>>>>> =A0 }
> >>>>>>>> =A0 diff --git a/include/linux/i3c/device.h b/include/linux/i3c/=
device.h
> >>>>>>>> index b674f64d0822e..7ce70d0967e27 100644
> >>>>>>>> --- a/include/linux/i3c/device.h
> >>>>>>>> +++ b/include/linux/i3c/device.h
> >>>>>>>> @@ -40,11 +40,13 @@ enum i3c_error_code {
> >>>>>>>> =A0 =A0 /**
> >>>>>>>> =A0=A0 * enum i3c_hdr_mode - HDR mode ids
> >>>>>>>> + * @I3C_SDR: SDR mode (NOT HDR mode)
> >>>>>>>> =A0=A0 * @I3C_HDR_DDR: DDR mode
> >>>>>>>> =A0=A0 * @I3C_HDR_TSP: TSP mode
> >>>>>>>> =A0=A0 * @I3C_HDR_TSL: TSL mode
> >>>>>>>> =A0=A0 */
> >>>>>>>> =A0 enum i3c_hdr_mode {
> >>>>>>>> +=A0=A0=A0 I3C_SDR,
> >>>>>>>> =A0=A0=A0=A0=A0 I3C_HDR_DDR,
> >>>>>>>> =A0=A0=A0=A0=A0 I3C_HDR_TSP,
> >>>>>>>> =A0=A0=A0=A0=A0 I3C_HDR_TSL,
> >>>>>>>> @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
> >>>>>>>> =A0 /**
> >>>>>>>> =A0=A0 * struct i3c_priv_xfer - I3C SDR private transfer
> >>>>>>>> =A0=A0 * @rnw: encodes the transfer direction. true for a read, =
false for a write
> >>>>>>>> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, wri=
te: 0x00 - 0x7f
> >>>>>>>> =A0=A0 * @len: transfer length in bytes of the transfer
> >>>>>>>> =A0=A0 * @actual_len: actual length in bytes are transferred by =
the controller
> >>>>>>>> =A0=A0 * @data: input/output buffer
> >>>>>>>> @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
> >>>>>>>> =A0=A0 * @err: I3C error code
> >>>>>>>> =A0=A0 */
> >>>>>>>> =A0 struct i3c_priv_xfer {
> >>>>>>>> -=A0=A0=A0 u8 rnw;
> >>>>>>>> +=A0=A0=A0 union {
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 u8 rnw;
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 u8 cmd;
> >>>>>>>> +=A0=A0=A0 };
> >>>>>>>> =A0=A0=A0=A0=A0 u16 len;
> >>>>>>>> =A0=A0=A0=A0=A0 u16 actual_len;
> >>>>>>>> =A0=A0=A0=A0=A0 union {
> >>>>>>>> @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_dev=
ice *dev,
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3=
c_priv_xfer *xfers,
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfer=
s);
> >>>>>>>> =A0 +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_=
priv_xfer *xfers,
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers,=
 enum i3c_hdr_mode mode);
> >>>>>>>> +
> >>>>>>>> =A0 int i3c_device_do_setdasa(struct i3c_device *dev);
> >>>>>>>> =A0 =A0 void i3c_device_get_info(const struct i3c_device *dev, s=
truct i3c_device_info *info);
> >>>>>>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/mast=
er.h
> >>>>>>>> index 12d532b012c5a..352bd41139569 100644
> >>>>>>>> --- a/include/linux/i3c/master.h
> >>>>>>>> +++ b/include/linux/i3c/master.h
> >>>>>>>> @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
> >>>>>>>> =A0=A0=A0=A0=A0 int (*priv_xfers)(struct i3c_dev_desc *dev,
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_priv_xf=
er *xfers,
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers);
> >>>>>>>> +=A0=A0=A0 int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i=
3c_priv_xfer *xfers,
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfe=
rs, enum i3c_hdr_mode mode);
> >>>>>>>> =A0=A0=A0=A0=A0 int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
> >>>>>>>> =A0=A0=A0=A0=A0 void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
> >>>>>>>> =A0=A0=A0=A0=A0 int (*i2c_xfers)(struct i2c_dev_desc *dev,
> >>>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>
> >>>>
> >>
> >> --
> >> linux-i3c mailing list
> >> linux-i3c@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-i3c
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
