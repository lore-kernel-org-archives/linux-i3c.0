Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4480BCE8D6B
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hU0FijsnkQruf5dQ0aT8mnS/bwRUx9iDczxNMDKEbP4=; b=A2j2q68gW89aAv
	19vTft4e4tsQLXadLNmFyj/e9vHuqpbSsPl30m7UnKJ9Jolq+bfnKJo7TftO04n+dDhTnUhOHCCip
	/rD98ALFmbKC9Qy3S7b5TxoFSfepK3XHuiH/UPawa6qUTg6+A0a/xCiAgQe3xky3x9iKkMMJcZFDZ
	tL8XFuyUJ3oSpIBnGhfC2CNJviivd4Np1hrjPX3WUEQAA2xZ4HeV6v90LCVl0IN4CZrAjxMkGTqmB
	AmYFzKOHTrCP+1PjvepnDWyRlutE3tnXPRjK9lpXGc1TeALFbobV2WGeMddCkLuVmL3L1yU4Tmj7a
	uUWVKoLOUgB0GN2rItKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Ed-0000000GKcQ-3fjl;
	Mon, 17 Nov 2025 15:33:43 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Eb-0000000GKbk-36hv
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 15:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMlWplLqTCVfCcStTfi5Yr3ZfmMNv3TmWdCX+p94yfpJs+JZlAlNIGIBNz9ImERoHYgO1xo2FvBgRsQs5qj7qy5whHhoo85cLvlprPcM6DcdtC/4YBCVI8lmtpFGQcAez3gWYHL2v/e/W/IvF5CHMS3K41x3D8YCjUrmo61FxciI4Ck1XIm3eikV9WLXnIgh9DcSR0Zt4h8qkXXM/yAylqlJPY4y7cFDZmfRub5Tiu2Sxq5I/SbUIu9nZSQA3lTglDBmk9oR0PHY9OW+gTvbOMEoVCQyJrGgOYKET25R7O6f55oONmq9xSY5B6Z6OJus8Gwm9v8XyKsBJyofLCJgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dt17IMy6YWNn6q5Pe3Do7dsbnA8aUqNlRsGxkYrMLHM=;
 b=B4jm1T3BYm98XrC1XwkC9IWMq2Of4sWUcqVZ1OIGcppVRMHMl2KYv4y2fT86KtXGdRGhb0b8eYqvR1khc8ikULlD6IVaX4cvmcm8hJHeTcuIQyb8mFazo5AT8sbYYPLS8UxdfqjhnUQ6wMF//ram3ktv9GBNMRWNjIWPl9jVC2DmTpidMBONnF1xsK/nBveVwpTQO4Va5piB1LYXaxi51PWWT+dnM3a2oUWZNuP45qQeMxAxFYIUEQ40ExdA09yR17V5FggTYKdAQmL5dlHM5lk6ax7O0ArKfDBLExLPRW+clAZOI0xtWwCXxQ8uHXcaBAynf+Jt9OJQ3LkQPuqG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dt17IMy6YWNn6q5Pe3Do7dsbnA8aUqNlRsGxkYrMLHM=;
 b=ScrW/hjDc9LxAek68HrWNDQ0DLEwDMIp8+th9BqSkCE/WZA4oZwE4dMzfcQ/Lkaoi6RtMtI++6RGrdIpWBnGwK3V/Hx/H+6rigNf/7JyJT4T7EJT2N9zD6nDnPH5SHxhpYLnCX7sLPxVBmg4KJ8Xp9RRifFlI454KftQ+kt1qY4RWnT+THwI7mwIOCHQWXBYMZIAKdhqh4O9XyWvA9LkGzg2bQ4VH0+I36gD4pyKFfpIMsLrqSJoe57Rh8Tu7V9d7xSiRMoswScq1M0dtcaaa6wsJGspkpJCjirUwn51290x/HNIv/j1aJ833W6t3VYuZz6Z+9rD7tcWLgd0i5Y2PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 15:33:34 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 15:33:34 +0000
Date: Mon, 17 Nov 2025 10:33:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 10/13] i3c: mipi-i3c-hci-pci: Add exit callback
Message-ID: <aRtARqLoyDxbuJm4@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-11-adrian.hunter@intel.com>
 <aReIjGV3FfOd/Q3W@lizhi-Precision-Tower-5810>
 <c5d1a701-4365-427d-ac0f-cd662ce01231@intel.com>
Content-Disposition: inline
In-Reply-To: <c5d1a701-4365-427d-ac0f-cd662ce01231@intel.com>
X-ClientProxiedBy: PH7P221CA0085.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::19) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e699b3b-37da-4acd-ee24-08de25eeab8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|19092799006|38350700014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?76V3v6LB5E34k/kz0GPx/GpCS/Xb9JHyVXq5rmyiywrpNUzcAMYSdHxDYNFL?=
 =?us-ascii?Q?RFg5umQggjJOK79Ixh2PUp1CdwH95uW97Bs7HQ21LHSd6rOfoY1+NsCNkARi?=
 =?us-ascii?Q?GLSGjnnX9Ws+2WElQj17BbUXCWdoxpFI4b/2Iz+e8JWk3gM1NjALtXnXIzNw?=
 =?us-ascii?Q?4BXk3MTf/1nxHPoja/AQw3FpfNVY2fyp2n0A5bTujEvlf9cuaMLQY4Eb2/+B?=
 =?us-ascii?Q?NW0fiBJvHBaQGFZudZ54zP5MqNlaSyviBQ1d7p2fCD0gCZUBzc5gdbevzCv4?=
 =?us-ascii?Q?Ev24bctMUSgPXs93w1aJ8yIE3MQafbk42c+vbJkL9jXbFpQEdWWsCPccNDmG?=
 =?us-ascii?Q?40X3D1Jrvva3liWcxbxcMzVX9gEZDIqpJQBwNUvr/U0IItHgnRf8b8SUH6kI?=
 =?us-ascii?Q?nLamXuEAAPB9I3l0PNi/8fGWPvXhjxLQF/nMdoXD1coc4n/9mpMLKu27XqY1?=
 =?us-ascii?Q?3mjO2Dw38zAhgKBkJETHnz0rcChG0kAJcjpWGzx0YxulbZ24C2eVHOhDz2cn?=
 =?us-ascii?Q?GNHf4wWbjNTU9IPhIDW7YBBKCqU/V9JgvsF6zH32tC7Q7oqodWKbw82XRIPt?=
 =?us-ascii?Q?hgYBDLno16dPGOI+xyCeiVhqQKBkJYBJ6ObZx9Fg1P/n3hF4smm5HOobna+M?=
 =?us-ascii?Q?iu3qq/7jX2WsfWgzgpTBXfY705RWMqcVMcK2V4VaZhEBTbpzHa6ooD31fdHL?=
 =?us-ascii?Q?t7S1F8jscnbn4QiupaFjCAREpQSlDfAL9SWN6sKrmUKZd7JcYkwe6fwo3+eR?=
 =?us-ascii?Q?IKy8so5vOjKh3DsS7lnh2ubU3J8pAPGC9+oroEzJMsjYV4jOCl6nJGQ6BbXP?=
 =?us-ascii?Q?fQNTbEvVMS6xjjTGz301nUcgiAX3EuSPfVLq0QKmkDlldV59SRdHr5/UFoMY?=
 =?us-ascii?Q?GYHO6Dvo6fXfU1qZMyqbzMYe3nYtT3/pykT7DEJLGJkGp7HPj//NYqqA8c7/?=
 =?us-ascii?Q?evqAdxN4hLcTYTJaeIyHOTlmm1dX9JM7H/RRvHc2bsfZ2JiVjkwn4jnhi2Jp?=
 =?us-ascii?Q?tW+0VRX47PAmMwh8T5mnxTN5uPNZzZfCklQju4tvY07b8mykgw+Si0+4nyBV?=
 =?us-ascii?Q?0Lb/Hr21uw4bIo7vgi64O8/eTdKnuUQLRfwzrtEyUhe7Ccli3EyLNF1xUkQt?=
 =?us-ascii?Q?PblIY5QiMh+Ldv/Wug3NrvfmzysGsNrQae2HI5ifb3YEK/6zxfMt4I6RgnBS?=
 =?us-ascii?Q?bdcAzpw7WY7WzKuF92iFK2DSzWtGEpOAhjgif4mNUzcLdPGe+yH5otdCOVsC?=
 =?us-ascii?Q?U+4f0zqsBdwZGg55iJhs82tOXgICn3SF2Hl5X4qRZ2J9uF0jbKeaS0SSSsf7?=
 =?us-ascii?Q?S1vs8pnqRL074V9hGFsLkJFesFu6241KzKMZmr2MtuPKVPBoqffuUUGSof0v?=
 =?us-ascii?Q?WdUpzqgUCKdAeGSb1hizPJsODl49Bvk9q2CVDHCOg7z2UjH1UQaziFKNpMV7?=
 =?us-ascii?Q?YqNJ97pARQoPyJSdZUsa0h2O0WJJPHwj0wyDXJVvYeBnw2PTA9Tu6zpKOUWt?=
 =?us-ascii?Q?57kWr1j7/J6oHedOesQF5HZwCwNJnk3KStYL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hdnemReo0k66U7Qwlj+p4gcUoRxQMfA52HRfbEGFgA6iBTzCWZf4WHT2WOo1?=
 =?us-ascii?Q?tJaW52WsbYoGH1QLosueIOBsosQNv/mqOlQSpn05ThlvpnX5FM27Vz1402N/?=
 =?us-ascii?Q?o9LETrN1lCG/nrM+FJ3o/abABdwrWvWGEQN+RNlm5jK34kNKbY4qMP92vLXL?=
 =?us-ascii?Q?qRCuIjdc4K/uNSM5BKoKwAzIlKls7q2C/9fNhgAguO8oB3ixHyKqGF0AbVt7?=
 =?us-ascii?Q?NCjIVJ47PRYc90W5eSUlUqYaacF0HoI3MrUBfo4Xr/x78ZQrdl+JmuKaCUd+?=
 =?us-ascii?Q?IMerL8UFY/UgaQVCe4rMuxivyvdTKIk/NlUoJaDSEESZ+5NaZqpdvqiBjcW+?=
 =?us-ascii?Q?S62A/VKrkrm6oJ/XXzMbFCzmQTqKhu6mkOr1chS+TBr5wkJS0JiczU1ppkU8?=
 =?us-ascii?Q?9UcMZMlarFEQccfbJKLMZOhh10bl53hl6grlbtqdTQwzKj9ZMRxf1pnFILwy?=
 =?us-ascii?Q?jZ03mokudJCwF4g9Ibie6Q1VCm1pDFmS//KY1HP2GZmR4eEKiA91OqNzDS8Y?=
 =?us-ascii?Q?7BMMnuVu5yPlH1sNK51RcijQ7p6+LAv1beyoj9AIwkOwjESceEEvOdC/NmPW?=
 =?us-ascii?Q?ieYFNm92R/lMA0O7KSOMTejinHcWyLH2m3VBaNJYl3vc+VhBJhUL8+tovF82?=
 =?us-ascii?Q?OKI70VLTLbZYFCmRil1kSoxu0gT30YiXCg7LbhRg99+Hc65Yk8z5lvLK0meJ?=
 =?us-ascii?Q?hfMmD5VvrPxdcX5ZFIHo4mP60O1LI9V/yZDOr0jhG2WpFoJm9St7dswl3GgX?=
 =?us-ascii?Q?o3j4jUq80F8hKO2vdPqDd7l00s29ieTkCte/JokW8bhGbVACCbfTFmJfV50g?=
 =?us-ascii?Q?6XqIr2AoxMkr/ocqqI7M+qnpHh9Gvv62ZuQwN2ib/c44aJaOHrr6faWP9mCe?=
 =?us-ascii?Q?4GUTQcTYy0mW7SroSOoxk2O2v30nFwlivTD61juJyStyp7TR7euWfBKx6sDb?=
 =?us-ascii?Q?t+5l1qc12P/JsA3JPgT3WUkTdCt0irkEqRoK/M9Af/pmwE9j7bFB5wqGEDeS?=
 =?us-ascii?Q?iHX+baP8PO2wyLyWtu1CI8KnFKLSsPnR70IvkqoKGb7Z1ZSrO3P3217lua3k?=
 =?us-ascii?Q?lvZU0IcupTPDtt5yH9wgtwIvVLTJxxOYAQ7vD39EKPPtZalVhv2q6nVh4nCe?=
 =?us-ascii?Q?wvvjP71t+NVt/rRK2ssdbfDiLIXUxryWuRN3oMkTWBndHEoCz/04S6z9hF7U?=
 =?us-ascii?Q?8ivNAB5/ueH1hgGVF3HULo41lsmR7bDUga1n83RB7qkqNkYW/PzuYCaSlVAB?=
 =?us-ascii?Q?YOMap8pCCAdxv50vsTMJ99ymVIa3IuQbwVFGPEBGRZBPxDt6AT47Y+VRXer3?=
 =?us-ascii?Q?AIyjdn4fZLIoO89g4lpUr8zaa8zFPPTfxxYZ0LqNIbi3fG1y19rrIN61F/Wc?=
 =?us-ascii?Q?OniwD5QUKqzcAUvhYnxF8IO39js0FS2bs+tL6UO2PNnq0xbhl+Fn9kKY3f2Z?=
 =?us-ascii?Q?Qx2VPyCYChy0vBG6TdyBdn6p4B+g1QitpcCFWSRJlPaEFeSWtEDNew9mUxLN?=
 =?us-ascii?Q?CQLeGwgtFDO+ZGtz+HSPZ0lEzfUIKFrcLl7R9llzGIwN50ac8j9TCQmWa8ac?=
 =?us-ascii?Q?ubtvTcJoC7DnTsiOI7E=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e699b3b-37da-4acd-ee24-08de25eeab8c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:33:34.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5a5FZrGtR/tYUC83/dKAwZcnCNvtXbWb0hD0JPueVzr26ZIakqwJKxOfAtrYS5/4xb3PzmsIZtyR9ZdCWe70Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_073341_802697_3D0F0368 
X-CRM114-Status: GOOD (  24.27  )
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

On Fri, Nov 14, 2025 at 09:59:51PM +0200, Adrian Hunter wrote:
> On 14/11/2025 21:52, Frank Li wrote:
> > On Fri, Nov 14, 2025 at 08:13:53PM +0200, Adrian Hunter wrote:
> >> Add ->exit() callback as a counterpart to ->init().  This is in
> >> preparation for adding device-specific features that require cleanup
> >> upon driver removal.
> >
> > Prepare to add device-specific features ...
> >
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>
> >>
> >> Changes in V2:
> >>
> >> 	Re-based
> >>
> >>
> >>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
> >>  1 file changed, 8 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> index 7bfb9fe337b6..b962d3c2d510 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> @@ -17,10 +17,12 @@
> >>  struct mipi_i3c_hci_pci {
> >>  	struct pci_dev *pci;
> >>  	struct platform_device *pdev;
> >> +	const struct mipi_i3c_hci_pci_info *info;
> >>  };
> >>
> >>  struct mipi_i3c_hci_pci_info {
> >>  	int (*init)(struct mipi_i3c_hci_pci *hci);
> >> +	void (*exit)(struct mipi_i3c_hci_pci *hci);
> >>  };
> >>
> >>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> >> @@ -72,7 +74,6 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
> >>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>  				  const struct pci_device_id *id)
> >>  {
> >> -	const struct mipi_i3c_hci_pci_info *info;
> >>  	struct mipi_i3c_hci_pci *hci;
> >>  	struct resource res[2];
> >>  	int dev_id, ret;
> >> @@ -114,9 +115,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>  	if (ret)
> >>  		goto err;
> >>
> >> -	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> >> -	if (info && info->init) {
> >> -		ret = info->init(hci);
> >> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> >> +	if (hci->info && hci->info->init) {
> >> +		ret = hci->info->init(hci);
> >
> > This part's change does not belong to this patch.
>
> hci->info is used in mipi_i3c_hci_pci_remove().  It has to be assigned.

Okay!

Frank
>
> >
> > Frank
> >
> >>  		if (ret)
> >>  			goto err;
> >>  	}
> >> @@ -141,6 +142,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
> >>  	struct platform_device *pdev = hci->pdev;
> >>  	int dev_id = pdev->id;
> >>
> >> +	if (hci->info && hci->info->exit)
> >> +		hci->info->exit(hci);
> >> +
> >>  	platform_device_unregister(pdev);
> >>  	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
> >>  }
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
