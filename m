Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC97CDB483
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofHPNvOOCPQsinIKDnPaMD4Kqu7Q5lTGC4xIrCA40Z4=; b=TLOMwx1vLDApMO
	r0l6qsN2uRW/ol5tiYGoQLX2YWbE2PZP4hdAKe+n+YueRrBDRSn6kv99vTfGLC1SAVYiEI78ohOLy
	c7gGaDAu0R7joid6EXGsMBx9FneogXZMTqZtP39+9L9y6a/oAUKf0UNbeTl62gnJWqBjp7ZoF90pA
	7/n8CR17e2cWjrNeQM/hkG0G+cUpUib3aC9m19A1F7neivE+He/MkLBc9S1UQilQuZ2eaRDB3ejjn
	z7Zl3yH7aC9WwtXkRFmAh9KqrRPtO95NX1IFsRE7xXol+oeEfvd0AUanOArpJIdPO+P7luRTJMtOu
	v27LAgjiYuZEQJTq5Kcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmUe-00CnWp-1A;
	Tue, 17 Oct 2023 16:00:28 +0000
Received: from mail-vi1eur02on20612.outbound.protection.outlook.com ([2a01:111:f400:fe16::612] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslQa-00Cd2g-2P
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:52:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhmujtX2J5qkU70UcQWv7fBr9oy5DCHx5eGrYo55f7TO5wzYmrU41lavDlEN7+iT4h7KcVHhRAwMutXVadgYg1RApysOTiEtUoyfAZl312ePQVkSeIyLVnFRNLWmjj5gkmuupK/drk6DwNmE9uU7brNR5kLhlGi/tTxtL0+DIbEmB0aM0SIHqtaSC/+oHpcPmYmuoa9daeFMuEIRtElDbVX69TnYmNyTCdyhywWmko2W2UNwwjuyE0RyBQ++/Pe2AB6/rdf8NTgUgxdOdPhgTt52LOyGSRoH9+avnf1UTAscxKQXxBW51cBqnBE1UbymzfjBLdcWCK3CPs31Mc/2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSRX9AOe4w7GT+PDzYAWMN/w7bfTbUeaFjIVukr5Hk0=;
 b=QIltvn//32eDdi5mOfZA/5eErlVHTVCvk4GD1rXbuJwugnMnx4JpOy5ZADsSTJ83f4MVjBnYfRYnvf9JpeF662F3nYI1tVWnibZ3TCRUridZ3kr+ylf4oonG95A5tMTDLXx9JCSGdCFL+d9W1MtEGlXjnjEnSqbjiEPorq6nvqdn2mQpWwp7AOBTWXP2DJujpDKIAh0DjZ3/j+zQCzj9+XIUxT2p9FRu7vybvkArahUkPV0WOkT6l4Lec23sXeQMmwP4mhR64i6Yw/Ng/vtkhkFLvKplIOtAltQKf+ez9SlqiMzKL22LcX9pgyPjM1YflsuxZaA5B9UaX915bdf3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSRX9AOe4w7GT+PDzYAWMN/w7bfTbUeaFjIVukr5Hk0=;
 b=LC69zAANS+vFusXTII5k0C7JB/YKXA5JCSH6KIwXmZnYHDgdsB5klIE6ffNKGGo7PP9pdhO6nrjpmAHcY60gsSbVLBRvr+/bs3H9HKuRTbAZ0nrG3Rye3UqLGjDH6F2N7Q1tc0cWSgoe28TCMXsQwy7We1vrU6OmsnZN7f88xHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DB9PR04MB9937.eurprd04.prod.outlook.com (2603:10a6:10:4ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 14:52:05 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 14:52:05 +0000
Date: Tue, 17 Oct 2023 10:51:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/5] i3c: master: svc: enable hotjoin default
Message-ID: <ZS6fbVtbuBH32aRU@lizhi-Precision-Tower-5810>
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
 <20231016154632.2851957-2-Frank.Li@nxp.com>
 <20231017160457.4f0c2490@xps-13>
Content-Disposition: inline
In-Reply-To: <20231017160457.4f0c2490@xps-13>
X-ClientProxiedBy: PH7PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:510:323::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DB9PR04MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: 116f4e06-77a4-47b9-b4c3-08dbcf20a0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: If2tCeFEOdjlLpye3+r9RAP0XUi4FglQPuJPUpf9BWeOespB8wQaHxzWm6zjU7J0GjSVNfk0W2ba+aB0mmsZuVpvPjQACxjD5DA5Hi5PzdDBIS7tkqLD7nTNICTM7VzxM9e+sULkItK4ECfFSLufaPdeJvSN+k6Ljq+XPImqnDINUPKB3HfHSSESXS+IwVfXuwgyNTdCkx14WVSCs/o7sWDnuTsChmCyh/RnfelaAQrgVlfnjepZbNPLt0N51u3hQ+/NznUia8rV1BrXRgkCrStx1FEf4GFUGexUJW2CLAWEWvXasO0eoTUAWbM3d869z8NqDtBUNcxeCFFS8hwLr9KHTwUBV8kSD04WpWNEkwtqI+FHxbsdKJQjAAKUVWR9u5ANL5srX2YeQYS9tilyHtl+XMAhL5x3gwfAi+L5pEKNL3hciaa2CRJe1gNWtJMOLfk1c1nAP9Y3yuqq7vDFRQ+/bPi+T3GLcsRqJAcIW6UvsGg7J+K1qgSRzzhbRTWd8x4WA8Vrn2wD0mbL+6y62eEgNGrlQt+szY2iKpPgVoAhQseaX+rMy9HdY4Up2ap9vTWXi0An0ndKTIdQEu1h8j7vBJSj0i9bFuoJE5t59XUbbArbX+lVMeNxFs5HjHS5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38350700005)(4744005)(41300700001)(6486002)(86362001)(2906002)(478600001)(66556008)(66476007)(52116002)(66946007)(6916009)(9686003)(6512007)(6666004)(6506007)(316002)(8936002)(8676002)(26005)(83380400001)(4326008)(33716001)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?i9P6xqlWxocV2WXbjkMA9DSSbTP04jF06yYcl47IrAap0uhQIh+XDfLPU/?=
 =?iso-8859-1?Q?WoynIdIIyu92ooZWJSSZhDvO+7tcrrXTLEEEi60YJExrO3j6YHJrxUjC/9?=
 =?iso-8859-1?Q?VxhntmrY9lnvamimqGrskeCKQ2mzU/B/TFjspNteUSrRtUM6tx/zv66xbA?=
 =?iso-8859-1?Q?FrCDGFiklOXhyTtl8nVqLo8HRMSs5A+PxUgUSLvnHBbrGhUzhIJVe/01oG?=
 =?iso-8859-1?Q?9GarWdtiLOMAOQU8Aukg97O2q2u5BbjA/xxNajLsnahWBtgr8AwxuHTsmn?=
 =?iso-8859-1?Q?ZcdU9v455YquZtlV3NooajhV9YMpZ3tVRZtfT/eCdObvQzX0HyE61ktr4K?=
 =?iso-8859-1?Q?416LlSXsyYhmgjkrWrMm9Hl+Fe9sswInX0vsly0xxxATCXb0pTgmLGjQ29?=
 =?iso-8859-1?Q?Bod/NdhvA3nuqodPYpYKmbNyFXrdZNlQoAx2UuDiywkXhIyRjZ/fcuEHiE?=
 =?iso-8859-1?Q?VPYN7ZpBlUGApb4ZgtzxJ6qbjR0eUntHjMNXLzeUSW3aLIQj2LCjs6mV3U?=
 =?iso-8859-1?Q?uAkMWxdwWnEg4XZY3A8XU+pHs3spJiVKaHbhpBBMKlt6WegkHKNn0tj8FG?=
 =?iso-8859-1?Q?edc+OFwxTHuuqQ0EoJugM8swRAMv+f4IUvj8k/sgwZNgSd2C/sbDTotiXW?=
 =?iso-8859-1?Q?gj9tnac29bHh+ZTdXrWuZZDpdUhh5omhWN2J74Y7gqbj1CNeWheGr7elk7?=
 =?iso-8859-1?Q?xKHKv4/xvNuT7CugH6kLOHHxb/1V6Go+vl1z61YmsRZ2WOEBq7/LLKDKEI?=
 =?iso-8859-1?Q?DjkGk7mx/I0i58obmDo7y8HXxKLJjftM7KCuRNzEWv1LlqEf9d3z0VLr36?=
 =?iso-8859-1?Q?sOMJGwFXKm5xpVGUK/VRKtsxgP2WGdOEHkxV1DIbpxNfTY20VIHI6EsE7p?=
 =?iso-8859-1?Q?OvKY9Mxi7zj8QF7ITNNy1g4QVsUiriBH0etLlnoDL4uL4Unl/19jUoS2Yg?=
 =?iso-8859-1?Q?g/usYdWa6vi4UbU7NGlJMsiMmUmeQfHKDNhJ/ZgRMZja6u+2NndJ139K3/?=
 =?iso-8859-1?Q?JZw/wEfF2bKHp/eGce+ABCOdlUHV6d54+ddgjH4GAb9RzCfUE8Z+nU0q5a?=
 =?iso-8859-1?Q?GfrOMw11SMWINaqHZ0qq5OOwHM0XBPkXPrGK7K3M4c4QdWpuVowHLoikmX?=
 =?iso-8859-1?Q?VGtnzl0oBrbIAT6tWvscKZ6mU4N4ClWvWiWkdo1I206xRPt77W8lkIJ2ac?=
 =?iso-8859-1?Q?0jbNNFNVbKwIP4TE/P+0pudLHWghUa/oMOvezXbZIYh4ViGipUXqzXUo6Z?=
 =?iso-8859-1?Q?UZZ78rayXqfKQWecZ3oZyuOKs5T/ZQehDabgJZqvgj/Qzzw1xBV33AMpry?=
 =?iso-8859-1?Q?8QBROGMK2103zZ+bGR5eXMwGMw8DbAan1uuodwfLRLmsN/GFiU1YWimwqa?=
 =?iso-8859-1?Q?MNdOK3i0odQW9uTOq2C+Q+HITLCL1QRfck/uW5gYwc/SrB7N9D7ItKr+MO?=
 =?iso-8859-1?Q?NcnBj8sdHC3cibRg4UJGDg0QyKoZVBe5xEIsLorzaPvFetOTSbW0BLzB4J?=
 =?iso-8859-1?Q?dhFLF8txomI/q5x1Tf7tbM/J2fNJ5yT/7YfmQsXC85yNb+SOF9+0BIqx3/?=
 =?iso-8859-1?Q?3tbnkvQrvu65x3q4vk7IJVYGsyEaiPQL/NMxG0PxQe548uNqKngXHj/QeF?=
 =?iso-8859-1?Q?o7qo0xHoyhNfDus7Rvq0w1FPgYrM48cHy8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116f4e06-77a4-47b9-b4c3-08dbcf20a0a8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 14:52:04.7414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phUMBZ+aHb6fVpVcaOI9jq1LntlybbEBI/MFh+IuaGDpqEKGevkYSBUGd/G0/IvoiO0R2u30mfNnbh+clmz5pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_075212_875645_5C87FED5 
X-CRM114-Status: GOOD (  10.08  )
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

On Tue, Oct 17, 2023 at 04:04:57PM +0200, Miquel Raynal wrote:
> Hi Frank,
> =

> Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:46:28 -0400:
> =

> > Hotjoin require clock running and enable SLVSTART irq.
> > Add module parameter 'hotjoin' to disable hotjoin and enable runtime_pm=
 to
> > save power.
> =

> I am really not a big fan of the use of modules parameters. Maybe it
> makes sense here. Alex, a better idea?

Maybe we can create sys entry to enable/disable hotjoin. I think i3c
should default support hotjoin, but it exist user case that needn't hj and
want more aggressive power saving.

If create /sys/ entry, it need change driver/i3c/master.c.

Frank

> =

> Thanks,
> Miqu=E8l

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
