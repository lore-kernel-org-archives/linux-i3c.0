Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40758D3C91D
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Dec 2025 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cA+wu/WLK7HyV6wp6mRCiBpO2jFFR85dbChMz5V/GdQ=; b=u7ST+M1lSrcnfA
	admOe2YW18WLxr+M+0hsSOiCK3BET7F8k4njmvhm06PyfakNtUuobzK0734C7WPKHDksWwQMeEilv
	w/xFVZD+/gBYFtHN85M8GPIV2pzkZi756dvPitxBfybWOEdLnAE2cOVe2VMbjQTaRDAdLBYQXDPGh
	avcf/GN3D6YCIuOvqwJNbN55uHezIgvmydQrt+NGTC7f2lqn+TwYuj9Mwcfr3lbJc7zR1m8Ak4ncf
	ZSMEqEEklYW1avdMb8PvMlbJ0V83ZcsAam1Rk9CYjdf7VP1/xp7P04BBhC7CercJvsmEd1Kn0uMqc
	XguPXyupCTuoJqv9Iu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLuG-0000000FY6s-3lLz;
	Wed, 10 Dec 2025 15:15:08 +0000
Received: from mail-northeuropeazon11010049.outbound.protection.outlook.com ([52.101.84.49] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLuB-0000000FY64-0Nwl
	for linux-i3c@lists.infradead.org;
	Wed, 10 Dec 2025 15:15:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAMPdr64q9ghOip4ogEzSmvLaF2oHSDSkxLuMFoNFy3ALZckX0o7jEfA7/lVAeq1VjYnf8mbiPO08Vs5Vek8gCY8dGkPCo38RvWi+Lk+43+06foUXgWxsIc3cjF3EMuHdc5sZdO01ryRNGsjiiHquwv6O/PqSFTspMZ0OdW1Uzc8qervgOssSZ0CkMYzEfaSpT0IKnRZOfTlv9FCGdZbjHY6MC+xZN/SEb1RGHP6wOpODrYUuZnnuUSrTjGcbsURwhudIJEYax3vmpA6uzYb+nfV/UjoCZoxCS13Zp+W0Uu44MMF6BYQpeW08zmgc90CJcfibAbmrmWLXK6KOCOXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvnHoyUctOJ1fEKq57Tt7uh5wggPFHZfJWYf1XH4/fI=;
 b=j/vnFsx/EzG7+DFM2fE5hC5La+ClnNPwXG9+nHa7/Tdx00wQYcVswbaIOtGHeWLPWuGD/39fOcpLmejdnc7VhM2uuofzr006Aiyfl2cA33ifXvw5mGQdBw6jLjW/bkcBjOa4P97rta28oCEaGBNUGXMoBjkRk42ISep3BF7byUOsvtakBVfqGhBsoL0QQJ+b6OdCQlXnTlTe5sog2nimeIBz/jhKFPcJ19IXEPoxi9EU/jBdWSwaqza6U3iwlZ1prNAeyu3I+MRiyuF/jwI87rauElYvZgAIXdf3HZBpR6/ATcxIPlIuxPzaYTZS0jjpRCyEw5x5pxE1gjtOdBzkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvnHoyUctOJ1fEKq57Tt7uh5wggPFHZfJWYf1XH4/fI=;
 b=GZmblVqlpvKfok8DAqMRU6vfEXzfwWz1L03+YHg/UxoAYsq6mz1ftt9snVFhMDw2XaiJgzFd5Q6SDT2jqRvD2xJ1gaNFuXIJ/AgAcWB8d7Y6EWkSAlAaCeOmI3GUQAx1jF7IDT5TqSoQMKohmD1SHmeHh5oUxpq7Pn+qSxm5n1FRjItus6mkeAljdRaDPmfAL1ZyAZaPu7zW4XqBAGOAnKlVE0+O9FL2AzL5lbVh3gUU9+E0CfeHxRXoF+rjKbt3WQ8GIPFRim2Mj6oClcTUZ3uWqUB2wH97pbcIH/yADyYQId6qOEIruolI6714VoGsLVM57c5g/ZJCJFnLEq5bTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV1PR04MB10894.eurprd04.prod.outlook.com (2603:10a6:150:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 15:14:57 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:14:57 +0000
Date: Wed, 10 Dec 2025 10:14:51 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci-pci: Define default driver data
Message-ID: <aTmOa+IuapQW7zDD@lizhi-Precision-Tower-5810>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
 <20251209115104.124156-6-adrian.hunter@intel.com>
 <aThQHLHCxp/SU92N@lizhi-Precision-Tower-5810>
 <d727d3ba-be23-4ac4-b693-68f7a0cfea88@intel.com>
Content-Disposition: inline
In-Reply-To: <d727d3ba-be23-4ac4-b693-68f7a0cfea88@intel.com>
X-ClientProxiedBy: SA0PR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:806:d1::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV1PR04MB10894:EE_
X-MS-Office365-Filtering-Correlation-Id: 0356cbc5-fcf4-4955-e8ea-08de37fee0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7053199007|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FlXoJrWxUBEN0r3xTn1+RsPaFOpcDOQj/K0Y1Mizl1BV2rlANMGOKJ8Ou6Pp?=
 =?us-ascii?Q?yub3XkvMkRiPoEM1Y8c7T/XB94A1ysLfxNXk9qkRpPZXnlV4BfY/UA71dsHD?=
 =?us-ascii?Q?EnCn5OCbWy2kesi2FmPKi8wVeKSwCyesEhGZqtVAt8qV5U/7NxRmu95maptC?=
 =?us-ascii?Q?gkmqUSqsC1L8O8Do6731wd6WvQpy1OHwFtUaX7ogmmrOS9Stia0bEKERRm3V?=
 =?us-ascii?Q?ltj0zPZGgzdFk6sgV4E9YMTFmG/W0NNQM/K1ZMzPrGUw2TvkA+/bqmeGvyMo?=
 =?us-ascii?Q?fb6h55geR7HU1I9uN9Pt/Bt9nMCa7O1qblH/SDCdBb5VaNIXpe3EFUH/tDTR?=
 =?us-ascii?Q?teyHhesAzG9qoZ0mIPssuoatTx9BsPbTWPT6hbV1/VVZDgzsPsaYN09rxgXP?=
 =?us-ascii?Q?M5LijNB40HaL3wc6h8HgPabZAVGaBCwrAN4zZjPQLW9T6jPYclanHGz91O1m?=
 =?us-ascii?Q?MAAjJ6c6ywvNcPQM+KZtG3N/T6Hxvcfjj0a9ho0L4dLX7zhRLG0cNW+A3OPC?=
 =?us-ascii?Q?PDfUWB4jxFiA+3rwcr+ZEcq6ox3y0PjylMbEUgLbPw4NA42AR1Cj3tB6dxNx?=
 =?us-ascii?Q?P2w2MPxqlmlImb4pnEMS0iT0A/dANr77ZJp48ziyZYhJCfVk8zmqTtm5cf7q?=
 =?us-ascii?Q?p7o41Fqh/dYGk10fWlKYYkHl1mZ8aXzpAz5bqpQOr6LBC2aLSEfvk6e7DNgn?=
 =?us-ascii?Q?ExVnkrpAb/zBZWRh9VZnP3a1phEOh6cLoRTv3Zwz0plhv+FMPaWDR/xQQkE6?=
 =?us-ascii?Q?ZuqtmZBt3epjCtYUUkU641B17VXWGb+japW7eGlGYZmlTZT9OqI1Dz9qlRkK?=
 =?us-ascii?Q?gtLuL7MPseU27AVWXkTjPpwOhvmccO7klrTE7qj/fRmLj/r7RSuNq6TSRm+t?=
 =?us-ascii?Q?w2DJ8+mPJasbLMlOjjkn629raav3J04Ju9v9zaeh2oAFyF2KhIXz+WdCEUeR?=
 =?us-ascii?Q?jtR8Le9xIjTv12wAk07h74IccT7Bvm0QTSYoItc/3qoDZyUf2dcOvZIiCv5H?=
 =?us-ascii?Q?jU1xif7qqRrxcfyFBOvBWtMbQniZegkwNK7flaWTIg1YwbxOP87BAMCtSNs6?=
 =?us-ascii?Q?PNLn8uE4E817fnVxOMB0foMT9hsEdDk2ie3mT8yVDHLMPluF9VeWNeiClS14?=
 =?us-ascii?Q?itnD35Oqduem3y0IOQQsUOlsATZKwjrA76Z3p3W2gBcyziOv1bOyLokDibcQ?=
 =?us-ascii?Q?4wDqMpAL4Eqi/WjGlghtulBsbfhQTnWsNIUUfdVpLJfRijZ8Pz/q9RzcTr7V?=
 =?us-ascii?Q?20ChQYMf93qm+Y69/KCtyj/4XXn8kOQMQ0ttlm2PBMedMwvfrv8k9/i6ZeCp?=
 =?us-ascii?Q?+muS4U1EcgjdIUk0AFHSLbi2Yd4Niz4boXY2BlatnwAwmiSo3PukAFVxtjsw?=
 =?us-ascii?Q?1wczgzWT1HBBfLlfG7f4Sf8HM70kKjY0AA7iA3FBkt7cFTrDWV3/cWr7GtYC?=
 =?us-ascii?Q?qU7ucnEBJiY/fneGGFe+NKxoVP2O0NHtP1MesyDprq8zUkJY6bZ9vdJsyNeo?=
 =?us-ascii?Q?jLILg4+vHofncHLetmmOPFztWMmfIdS6X7NN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7053199007)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aZ4+BZToWHWw/zu8RqwAG4JISWqeUrh0IlbfDVVM1uiAtAg6jGu1W3wcOaGe?=
 =?us-ascii?Q?RKG85M/gMs12WFxPvIRPSI4eGxndQr/VYl+n8kA7TYKGCYgocA46svcKHqhu?=
 =?us-ascii?Q?IolVogspBV3QsLqki2ozlpRFgN2shpZvl2X0lZU/sSm3KAWzG9sqfUYHtbhE?=
 =?us-ascii?Q?s1zlJnXJLwDu83czKYsL5JxCcBtBYj54MV3eRYQHNvp4+5/2btaqqZVgkPsy?=
 =?us-ascii?Q?uJLPy8hJzLqPZYPyKIrnNWe4eDECr7aNWfj0wb27VIGy+pu5tQpeujJwvyka?=
 =?us-ascii?Q?JpQZEC+I1rrzJxoTo01uxIdYzsUObO29Jx14BfxRDkwEuj1dT208IjEF+ZIN?=
 =?us-ascii?Q?WQmyiWsmaqQiE9UAFnmK0ElKaYOb1Sd787uUUumCtDXxecErMyDcm059vTE3?=
 =?us-ascii?Q?zN/1SS05jsqnVaf8M5x+LNhtm5bc8hx7mQSo811efcO40jobTdC/WqM6JpKN?=
 =?us-ascii?Q?/rsN43HvAfEv2chuHCt28cerDHINRDAAZNT07f1WXthNf5GVo/lRs0yVGgaO?=
 =?us-ascii?Q?yeE0LdwPJ7xQ/Wxa+0RYoZKNrmCRV0FRWRVEb7Iejg14oRAQcrRtP/SsGPvI?=
 =?us-ascii?Q?HSaoWdaiKRsGr50YUbt19Nfs/CiUdyGXZCzVH5+qT0hGfBa+l/arX0T9902M?=
 =?us-ascii?Q?TSXWqxr3e+kP9Er6DExj/tydk0XJqlvQ0qkdQ0XPWExhPtesyhABl7PTiBBq?=
 =?us-ascii?Q?pTI3t+sykfPSJSP1kR4cSzqoL1e59L3AcUCFCbMoJhWiKcGWUsa9GptETR/G?=
 =?us-ascii?Q?S7G7trk9HyCsl3TLTDzIV6Otri0s9ClGLswu6pMMGW9uUZ/DbyMMOmZjVw3p?=
 =?us-ascii?Q?yT5FF/qHVuR/Rpz42a7em8AFXNJarpp0FoKjSojVLmBhZYKUi8bs8BG5rQtY?=
 =?us-ascii?Q?2NH+Bwm8wLqbZsHk48iQXtzT/fgijhqjvQ/83TzmUOZhO5rkG/5/ce8lLygU?=
 =?us-ascii?Q?9fJg6vqlZBcTU6VTIIHUbDjkk2kPgori2I3QRe4yCbASHU2bk2D4wbDW4clP?=
 =?us-ascii?Q?6lb6TLRveeJeO+lQTqZl1hTfxWG0+kH8WUlqDCoI8jeg4zRfzK0ZT5A7mJHR?=
 =?us-ascii?Q?04JZVnx0Nw77jssXqd9UzZgvsvvGFiBryEz0WLCRjBJbMXR0KO0MQPw2TMJL?=
 =?us-ascii?Q?muZ+BBUprygp0nlIXpC0+zSNQlboYTxAWwJVD8cfra0RTDte5ZXGVMLf3feA?=
 =?us-ascii?Q?bTpD+4mu8zMP+e6rymADEYyRpwEWTlanFcP/oSkQLfDyHWHP2zHQnMrBVSXr?=
 =?us-ascii?Q?GFDw7ZaWd0W2Am8hMB1TRKnXXL4EJ9aUJczK1ydyuLDzi6UdxMfoQyi2g+yT?=
 =?us-ascii?Q?1w+0LWBYf8L7PZyF1j2CFjdm1MwXbZSIvegcY15GlQdxrLbAKFVJTcQ3GZhz?=
 =?us-ascii?Q?EfVPXIZHMK7Kh+up8F/H0pbGvbuQOR2079GgzOCqCVGf25bGQH1sji8w5LST?=
 =?us-ascii?Q?VbwWmnetQWk2ITc5it+W9jKhxdugMoop6nWkK765guLWyCfeIkFgNVLHpDXK?=
 =?us-ascii?Q?oV6DX45ar8bfAd1qJSSpGWtFMAw2DNeXcWoy0Pxu/etyaXmNyrBIFwO3GfqT?=
 =?us-ascii?Q?UiE0Rx9b2Mbxvs4NVEMXZazm4EJ3oT+CFbfIuJRf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0356cbc5-fcf4-4955-e8ea-08de37fee0f7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:14:56.9828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKU7Z4/8Ax7fnZqJ1wBDEQQ3S6vgnwWkUnQH24nRj4NtxNH5YcUNWlUReF8KCnVJ4CGbpR6ADdgjNuv1ymbLnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_071504_288254_374B631C 
X-CRM114-Status: GOOD (  20.91  )
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

On Wed, Dec 10, 2025 at 10:27:05AM +0200, Adrian Hunter wrote:
> On 09/12/2025 18:36, Frank Li wrote:
> > On Tue, Dec 09, 2025 at 01:51:02PM +0200, Adrian Hunter wrote:
> >> Define default driver data, to save having to repeatedly check for NULL.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 11 +++++++----
> >>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> index dc8ede0f8ad8..ccaec5d3d248 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> @@ -184,6 +184,9 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
> >>  	.exit = intel_i3c_exit,
> >>  };
> >>
> >> +static const struct mipi_i3c_hci_pci_info dflt_info = {
> >> +};
> >> +
> >>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>  				  const struct pci_device_id *id)
> >>  {
> >> @@ -228,8 +231,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>  	if (ret)
> >>  		goto err;
> >>
> >> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> >
> > I see all devices have driver_data in mipi_i3c_hci_pci_devices()
>
> Seems safer not to assume that.  Alternative is to return an error.

If we can guaratee, needn't reduntant check.

Frank
>
> >
> > "
> > static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
> >         /* Wildcat Lake-U */
> >         { PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
> >         { PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
> >         /* Panther Lake-H */
> >         { PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
> >         { PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
> >         /* Panther Lake-P */
> >         { PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
> >         { PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
> >         /* Nova Lake-S */
> >         { PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
> >         { PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
> >         { },
> > };
> > "
> >
> > Frank
> >
> >
> >> -	if (hci->info && hci->info->init) {
> >> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
> >> +	if (hci->info->init) {
> >>  		ret = hci->info->init(hci);
> >>  		if (ret)
> >>  			goto err;
> >> @@ -244,7 +247,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>  	return 0;
> >>
> >>  err_exit:
> >> -	if (hci->info && hci->info->exit)
> >> +	if (hci->info->exit)
> >>  		hci->info->exit(hci);
> >>  err:
> >>  	platform_device_put(hci->pdev);
> >> @@ -258,7 +261,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
> >>  	struct platform_device *pdev = hci->pdev;
> >>  	int dev_id = pdev->id;
> >>
> >> -	if (hci->info && hci->info->exit)
> >> +	if (hci->info->exit)
> >>  		hci->info->exit(hci);
> >>
> >>  	platform_device_unregister(pdev);
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
