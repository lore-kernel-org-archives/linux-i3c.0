Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35609D3C91D
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Dec 2025 15:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXN6ealu+Fe5OdhrByeZLmg8exAHOv1GrZQkrjC6bOk=; b=0TR6BMkgUG1O/D
	ubqi3QyNmhqhcK9FSq6eA9adTmbhrgBNMXBz7t0N8qobq4jaY80HTZ/4Rgj/BgV+NS0+UvrdDHDSN
	XJUwuejFBU/4PC33Z380XZKbkfRZV0pLrsZIk8DZSNQ6qwzuvpYaPEFZQ7aH+o8i8L4mn6NH1ERFe
	/tXAaikB4KhMvKVyioNjVf6zjD09pIpAOebX4ymCofAh9wfOxoF4aC1bamMag5v324mlXY0kI7GLS
	OvkgSnTvk4SkvtaEjEjAmwQzYeorN40agRpo4Ra7blywj8y5AXGpcgFv+mE3ZS5W3ROf/uVQFU6Vb
	WPSEKYta4cE59zQO+5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLzU-0000000FYQD-3zd7;
	Wed, 10 Dec 2025 15:20:32 +0000
Received: from mail-norwayeastazon11013037.outbound.protection.outlook.com ([40.107.159.37] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLzS-0000000FYLy-0snH
	for linux-i3c@lists.infradead.org;
	Wed, 10 Dec 2025 15:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnYRgGMtHrde9HsKqpg/ejXQ3NOg2bRqClpdUVPZ9riF9xEc6jCuib0RiWhY75HjP+8VgqZQvhHneRVSsr9YJ1v3cyjnJqxfN+vWwbWzwgjy3NOvWUnQ7mpNcUE6hmpABnyUgjNMO5VBQHAt3XGYh3aalBOd3c+OIgWhB+hYGxAYeVvo/1rH+nHGL1nS4g3KtdqUOfWwg6zlB8fcgcwAbkSRU/MLrZNJI8ttUVBDq0fQ2i9v2t7gD0ecHAdPgRAbMcZDHMFDRcfRpGQqLH9YPCGvuf8/HYIp2rvMyrZnzPvQiynq05xgeRXDBxc4tgB+1AcTD+ZZoclXxXuwZr60EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quTAIg2fBjw4h1Z/o372ptQ5Ie6UBUIYh4GfstMvsbY=;
 b=fm/MsybrU5Hh2V9kzFF3Vm1sXH9kS1VOK533Ab+lIF13e8aPv5R8NY5kEiVNERYr6sRB6+7dRk7Vhrfzw53joTuW+066T6P7WT6APmLjcD3r/gVi3Xq8B49DJhlvpYeY91wm8GFqSf+jbPmljrWXizS9r11w6/mI/X/SRS3h4stJHEGVokDzjfvA6w/86SU+6w1mFN8s8vvXqmmmTsyuHFkCfeuzh5lTn9JZXsqG9p+2FOvdrBqF83QErmR+scLMNQ+nZ+dcSVH4KplQlqEiTJObjDN9ust8KgjMItNr0whbvbpRycDBa818SiXaBqmCE65bxPq+4sortje5LD5omA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quTAIg2fBjw4h1Z/o372ptQ5Ie6UBUIYh4GfstMvsbY=;
 b=Zf9iuT9jLjNFqZDJdA/aPqimLwMBZK3Rx4hTjQYfH2VTqsWXZ/x6FME6IlAWPSDQqIWmDCvkPVZ8vIGHHjxBDXQisoMev2LALKl5sUgXY+AuE0Ns8/hF5RYdUQQSmCqAa0ELd73GiVI5bAOLe6MeOMpYwKBP0e0KE4FYESP+tIxFULYhhfHzP4Jr5ReXs+VD4R3EBeTwIpr4IFlgofCZ3xj+rgFHBerLzCqTPBoQqzDNzU++VXyuV6l7cHz/r330bEsZjP2eD4d7PujSEC6dkm6rUJZgrKanvyjKeulyiyS7yznFkSMeUa7rRXqr2/hs7eTgDw4Y9xHvi08Tu1S8Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAWPR04MB9719.eurprd04.prod.outlook.com (2603:10a6:102:38b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:20:25 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:20:25 +0000
Date: Wed, 10 Dec 2025 10:20:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Louis Sautier <louis.sautier@ovhcloud.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: Error while loading dw-i3c-master: UBSAN: shift-out-of-bounds in
 drivers/i3c/master/dw-i3c-master.c:885:12
Message-ID: <aTmPs3yviUjr2lXR@lizhi-Precision-Tower-5810>
References: <66f5e4db-ac20-4bec-a437-af86aad1f56e@ovhcloud.com>
 <202512082058408ee92ee8@mail.local>
 <b9b568e8-8e21-49ac-b3dd-ab750fc329aa@ovhcloud.com>
 <202512091248543fcf4c83@mail.local>
 <c7e29aeb-c258-45e6-af78-9a81ee8de327@ovhcloud.com>
 <aThbaFalAXblN56U@lizhi-Precision-Tower-5810>
 <55935d9e-a647-4cd0-86a0-915c4aebc302@ovhcloud.com>
Content-Disposition: inline
In-Reply-To: <55935d9e-a647-4cd0-86a0-915c4aebc302@ovhcloud.com>
X-ClientProxiedBy: PH8P221CA0051.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::19) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAWPR04MB9719:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1e6ba6-a8bd-4110-ebe2-08de37ffa4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AEv1YjttHoOiqNfT3JMgeDpTs8w6ppRQIrbKW0olR/tlJljE5SK6G3br3y?=
 =?iso-8859-1?Q?DJ1JFS7AJ+s1miUCPbzfSF8shjnz4x4x/qj3MbTxqTID7u3Xdq4d+SvyCQ?=
 =?iso-8859-1?Q?0EFXq7k2EplMBvl5CCYOO5pTN98E+SZiFcywnlbogIMc8U2M+b3BM8uf2Y?=
 =?iso-8859-1?Q?kxtYtsxSLesSDNZzzsoikYeG/oIXvFeRZt67mzZNuUZLYWGHyHdRTUr3Ph?=
 =?iso-8859-1?Q?rLVm+zz+VdDwZTfZXttD/dGvvKDy8Vp4C1aNtJiahmBo/DnFiWMdU02fCv?=
 =?iso-8859-1?Q?eL/v8PPg6BEj+K9PYKoqJ3td6uBx8ZMKyZ9UvnMY0Frlux43+yZg5h1YsF?=
 =?iso-8859-1?Q?4NGVkwVBoz439f9GtIFRQjb9F1TJyV2BjfWU+EntNP8hCLIMRbh65loeF/?=
 =?iso-8859-1?Q?OntD6k4aa+WePiGJwrq2Z62tXa3iTw4+iMZRqfPWBKg4sEcPr72ejf2zlZ?=
 =?iso-8859-1?Q?aRVW7pTs9TfdmaqdXgNTFP+QIoN27mpxcodKE9Mu42Z6TrX6M9EA9jASH2?=
 =?iso-8859-1?Q?V423B+0Z2Ohz1UaDXHMQpk0TsNzMc6wB648nyHH/dKWQYgObRZr2/WCwYU?=
 =?iso-8859-1?Q?lw406z2ne4i7X7PHv+LoiJJLVdGWLyEGFYSNSuWjhama2jp/L2cs3g4Xnm?=
 =?iso-8859-1?Q?NCpSE7z4GtWnCfy0M8OsdCDdp3/9L0yh1zLio+K1H+RjPbx/gVsaqsUK75?=
 =?iso-8859-1?Q?N+pljTnVIxRlkBvZiG48n0w4aq2HDxSvVOj2TA55U1eKyrtxKTcTfYDL/r?=
 =?iso-8859-1?Q?oHt8g44minUOjeZl96u3PWHmJ8kYn0li4X5b+f7bhHLB+jfbAj0oPsheM5?=
 =?iso-8859-1?Q?QCgeWDlpuNrX6owxaR195Ga7L2TDyRBl9m3ImfRCbKsM48ekrOI5N1AzJd?=
 =?iso-8859-1?Q?f8hDaDNFWuAXGdr2oLNUxtHqolvQXo3tNzKS5uw6O2fFBz8xdD/ST0bu1J?=
 =?iso-8859-1?Q?mQKfpckdAw3smCWyANHz+tAGqz9DwWmGlrg8SDtKX6NOXuK7mokmWf6XTD?=
 =?iso-8859-1?Q?1iQlqo56UmyC/ijIRzEEQAtVLeLk7OzYtvsTB4HEFO7ZmkmxZz/gxbM2W+?=
 =?iso-8859-1?Q?fF2FOGPJuUlrT8G0+qg/B7XI3OVs0W0FfxrqiWfZJQB7zV1wjgjFOym4qU?=
 =?iso-8859-1?Q?zCmDWXwsoMEQ48P8qv6KCq9WJbLcjHtS7/G6ukgkUstXgnHvmbMEjkGXnI?=
 =?iso-8859-1?Q?XI5L36zg6oyf7sX8zVOSZkls98rosETHRXuf4p5OX+f3KUnqM2Qh6rJ7BO?=
 =?iso-8859-1?Q?U38bAOS/f8pq9Mx3GGR3IS33NrB0UAvOS3VdIsk2alexCMz01BZT7a7qrj?=
 =?iso-8859-1?Q?SpEjz0SXArfdAKHLhvNsXfCNEgDpSi6lRHJHzndX0EtMW7XMtR9Dshri54?=
 =?iso-8859-1?Q?4oR/t161pkm9TbEOA2rXbgAcuWbTApiCcsNzq9Sss9Bw1XyuhgodkRgxHw?=
 =?iso-8859-1?Q?eFApIjuy3X9ZMHezrk1y+0dzeEmJVUgAWmiZ+kmQrku2Pyq3Ua+7RBnto3?=
 =?iso-8859-1?Q?WRZfKIJJRWV0GUAjc3pX9tlvbmO4cKbT3zKGbRoz1e9w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IkEU0qqJjNBc7aJ2urlPk3NenBG5k6iYoxz+ZKbWSGzfZMtZSGtrdCntwF?=
 =?iso-8859-1?Q?LGv/hy9hWG8shbddPiGtPPnNmfducZmqcQbHSL/OmWCOZ1rdQOeCJCXhDh?=
 =?iso-8859-1?Q?MCN5pb0CXcTuYTmSzRT03Iq+baUraxiy9HoufNcyKwsSeKGR43s4WsBk9H?=
 =?iso-8859-1?Q?eOPVeNr8qWMcFgW5E63aebfk41UZecNCFPaOapGbx8wnriCzVI5T3irajf?=
 =?iso-8859-1?Q?9QfxaR0lpKxhn6Z1GAiDyp7JVmu920ia/Ri9xaco6mOflUd2QAqbTiTE0o?=
 =?iso-8859-1?Q?FDwOqRxV9q97JZZPYQc22GQejQ22tB4hZFGqigngo4OOGvPQg5DnIwu/U5?=
 =?iso-8859-1?Q?vSJi7GJFnBWVtpyVhVxYnYeqvuE4I0bVoXChn2o3BDzv0xnRRItbuGxTKS?=
 =?iso-8859-1?Q?0aeHEkbVbL7UDBCrdeu07HUFMSQYsNWDH4Zuc1OgStRITfEcl8pZUDmyXm?=
 =?iso-8859-1?Q?IpIMfFHUiitQWR9G9CBgJeiEwIH2TO2Zq5kFesgt5WApOgt49ZlTVotrfz?=
 =?iso-8859-1?Q?DkTvle1txt74hh+NR4OsXPXjR17s8BpqP6HnWEkMAtEDKdZMXJse1deR45?=
 =?iso-8859-1?Q?mS262m2stm8R8rrgByS1kgxsvcZZcf+bY54fSGOOIcf9BawlR6uzdR9y1Q?=
 =?iso-8859-1?Q?87VBQW5nNnMRIv5wz3bfPeGPvmDd8OEOcxbkEXG12YbjN1l3V+GyyWGZzH?=
 =?iso-8859-1?Q?rnGJN6j/J4QYylGxcmmxKXOPTjz4n5AvkQvc0tUOd3ArD+9VXxzstLuPew?=
 =?iso-8859-1?Q?qXyAGij+SHQSlr35K5QZPiiOPga8UWZ/R6eHCL9FZFyOmmCvPsMu2KxLc4?=
 =?iso-8859-1?Q?0E3977BeX6OIRAGTL/bxI44a0thmvzcVXEx8U7YwE2CiNqLLCCjV97oPf6?=
 =?iso-8859-1?Q?tKbhMts3YreddwVTmbx3uETYF1oqBRjKEwUci1us84F04/IZTiXh6os/0W?=
 =?iso-8859-1?Q?t9sS3C4y0H/2tTQYXkOiK2QKP0w2YRNgpRhLlWz8DUuXtuI57I69KOjF0X?=
 =?iso-8859-1?Q?ugI2yNQiWF7JAH8h9uCKKxSVosY0JA+UyFz/dYi6EN/PZb1dMjHEzBKnBt?=
 =?iso-8859-1?Q?P2f6KE5YoTZa7sl1XT/qPk4CViGS3qSFOvI5Eyn7L4eWsDkTSQlT0AIOAA?=
 =?iso-8859-1?Q?+1D1e4wUSkww3veaQMXmYA1AX3FySDm+LifvrJGEKBro7L2DFZJXuAWa4E?=
 =?iso-8859-1?Q?vm0NzDEhH5l2fP8RXJYvRVAwl5099f7ZV3IqMUsFe479FzRcU/O94vyEVo?=
 =?iso-8859-1?Q?MPBDAJJuFGb93y4S6bvF+HApHLQNZAj6F5eF17OONJH+gjC59I+twFMl5A?=
 =?iso-8859-1?Q?d0f8gAQdnreIg2e2aXSnN/7Mx6WhlsbuWmVGKBwT5cDc27wtne2o4Y53Ub?=
 =?iso-8859-1?Q?mfghBIly74gsdbwxH+prJkhvwYS88o0kNcOKYdo31JQO0sJXY4W2cNwWCz?=
 =?iso-8859-1?Q?Gn5L1AjlbYnucv9ATlCpslI7luLl2wkk34VxOqNa3tfdF9c8ttfRgkRfbD?=
 =?iso-8859-1?Q?FL3va70txNKaTTgaOzrmtg9wUaFwz0tR3io0zj8c3H5a+DLLo0+gN9HDl+?=
 =?iso-8859-1?Q?4Z88a/mMYaU2p+vLjKjeMwj5ccMoC3Lo5jwqqGOXSQe/CGnt1ULissv9JC?=
 =?iso-8859-1?Q?sVTXBNrFTfxQZ8H8JXyVwNpgxiM8AHN6PX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1e6ba6-a8bd-4110-ebe2-08de37ffa4cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:20:25.6734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DV4gZWwyRULsudKj218dWTD1beykn4zsKcnt5z0vQvJcT8ElzkGUdWNSu60cmr5Wl7EHvkWFh/Ay3rVSt5d9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9719
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_072030_410399_19AA6F45 
X-CRM114-Status: GOOD (  34.24  )
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

On Tue, Dec 09, 2025 at 08:52:46PM +0100, Louis Sautier wrote:
> On 12/9/25 18:24, Frank Li wrote:
> > On Tue, Dec 09, 2025 at 04:36:30PM +0100, Louis Sautier wrote:
> > > On 12/9/25 13:48, Alexandre Belloni wrote:
> > > > On 09/12/2025 12:37:12+0100, Louis Sautier wrote:
> > > > > On 12/8/25 21:58, Alexandre Belloni wrote:
> > > > > > Hello Louis,
> > > > > >
> > > > > > On 02/12/2025 21:17:31+0100, Louis Sautier wrote:
> > > > > > > Hello,
> > > > > > >
> > > > > > > I'm running into a bug when loading the dw-i3c-master module =
on kernel 6.18
> > > > > > > on one specific server. I suspect it has to do with the large=
 number of
> > > > > > > CPUs=A0on the machine=A0(768 threads, from 2 AMD EPYC 9965 pr=
ocessors) but I am
> > > > > > > not sure.
> > > > > > >
> > > > > > > The system is on Ubuntu 25.10 and a 6.18 kernel with https://=
gist.githubusercontent.com/sbraz/a6f37fafbcf9354bbe4eace9e9eb48cb/raw/115da=
594dc9d7ea99b06754847571e6fd76d9da5/config
> > > > > > > (basically Ubuntu's).
> > > > > > Just to be sure, does this also happen with v6.17?
> > > > > >
> > > > > > The only change is the shutdown handling so I would guess yes.
> > > > > >
> > > > > Hello,
> > > > >
> > > > > It does happen with 6.17. I initially discovered this while runni=
ng Ubuntu
> > > > > 25.10's stock kernel (6.17.0).
> > > > >
> > > > > > What is the behavior when you build the dw-i3c-master as a stat=
ic driver?
> > > > > I'll try CONFIG_DW_I3C_MASTER=3Dy and report back.
> > > > >
> > > > > Someone also suggested (they didn't reply to the list though) tha=
t I add a
> > > > > printk to see what the value of maxdevs is. I'll provide the log =
as soon as
> > > > > I have rebuilt with:
> > > > >
> > > > > --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c	2025-11-30=
 22:42:10.000000000 +0000
> > > > > +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c	2025-12-08 18:1=
7:33.151567225 +0000
> > > > > @@ -1588,6 +1588,7 @@
> > > > >    	ret =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
> > > > >    	master->datstartaddr =3D ret;
> > > > >    	master->maxdevs =3D ret >> 16;
> > > > > +	printk("maxdevs: %d\n",  master->maxdevs);
> > > > >    	master->free_pos =3D GENMASK(master->maxdevs - 1, 0);
> > > > >    	master->quirks =3D (unsigned long)device_get_match_data(&pdev=
->dev);
> > > > >
> > > > Yes, that was going to be my suggestion.
> > > >
> > > I haven't tried with the driver built-in yet. This is what the printk=
 shows:
> > > dw-i3c-master AMDI0015:00: probe with driver dw-i3c-master failed wit=
h error
> > > -110
> > > maxdevs: 65535
> > Maybe ret is bigger 0x8000_0000, and ret is sign int. so >>16 because -=
1.
> >
> > unsigned int val =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
> >
> > master->maxdevs =3D val >> 16;
> >
> > Frank
>
> I tried this and CONFIG_DW_I3C_MASTER=3Dy:
>
> --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c 2025-11-30
> 22:42:10.000000000 +0000
> +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c=A0 =A0 =A0 =A02025-12-09
> 19:21:52.735366616 +0000
> @@ -1585,9 +1585,10 @@
> =A0 =A0 =A0 =A0 ret =3D readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
> =A0 =A0 =A0 =A0 master->caps.datafifodepth =3D DATA_BUFFER_STATUS_LEVEL_T=
X(ret);
>
> -=A0 =A0 =A0 =A0ret =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
> -=A0 =A0 =A0 =A0master->datstartaddr =3D ret;
> -=A0 =A0 =A0 =A0master->maxdevs =3D ret >> 16;
> +=A0 =A0 =A0 =A0unsigned int val =3D readl(master->regs + DEVICE_ADDR_TAB=
LE_POINTER);
> +=A0 =A0 =A0 =A0master->datstartaddr =3D val;
> +=A0 =A0 =A0 =A0master->maxdevs =3D val >> 16;
> +=A0 =A0 =A0 =A0printk("maxdevs (unsigned): %d\n",=A0 master->maxdevs);
> =A0 =A0 =A0 =A0 master->free_pos =3D GENMASK(master->maxdevs - 1, 0);
>
> =A0 =A0 =A0 =A0 master->quirks =3D (unsigned long)device_get_match_data(&=
pdev->dev);
>
> And I get this log, so no change, really. I assume there's only one
> "maxdevs" log because there is only one attempt to load the built-in driv=
er?

It may have dependence missed at drivers. such as clock. when built-in,
this driver probe first before clock ready.

If build as module, other driver help enable this clock. So it can get
correct value.

Frank

>
> maxdevs (unsigned): 65535
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:1592:21
> usb 1-1: new high-speed USB device number 2 using xhci_hcd
> shift exponent 18446744073709486145 is too large for 64-bit type 'long
> unsigned int'
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0 #4
> PREEMPT(voluntary)
> Hardware name: Giga Computing MZ73-LM2-000/MZ73-LM2-000, BIOS R23_F43
> 11/28/2025
> Call Trace:
> =A0<TASK>
> =A0dump_stack_lvl+0x5f/0x90
> =A0dump_stack+0x10/0x18
> =A0ubsan_epilogue+0x9/0x39
> =A0__ubsan_handle_shift_out_of_bounds.cold+0xdd/0x1c9
> =A0dw_i3c_common_probe.cold+0x16/0x1b
> =A0dw_i3c_probe+0x30/0x50
> =A0platform_probe+0x42/0xc0
> =A0? driver_sysfs_add+0x63/0xd0
> =A0really_probe+0xf9/0x370
> =A0? pm_runtime_barrier+0x56/0xa0
> =A0__driver_probe_device+0x8b/0x160
> =A0driver_probe_device+0x24/0xd0
> =A0? __pfx___driver_attach+0x10/0x10
> =A0__driver_attach+0xef/0x220
> =A0? __pfx_dw_i3c_driver_init+0x10/0x10
> =A0bus_for_each_dev+0x8a/0xe0
> =A0driver_attach+0x1e/0x30
> =A0bus_add_driver+0x13e/0x230
> =A0? __pfx_dw_i3c_driver_init+0x10/0x10
> =A0driver_register+0x75/0xf0
> =A0__platform_driver_register+0x1e/0x30
> =A0dw_i3c_driver_init+0x17/0x30
> =A0do_one_initcall+0x59/0x330
> =A0kernel_init_freeable+0x2bd/0x340
> =A0? __pfx_kernel_init+0x10/0x10
> =A0kernel_init+0x1b/0x160
> =A0? __pfx_kernel_init+0x10/0x10
> =A0ret_from_fork+0x202/0x230
> =A0? __pfx_kernel_init+0x10/0x10
> =A0ret_from_fork_asm+0x1a/0x30
> =A0</TASK>
> ---[ end trace ]---
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
