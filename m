Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3AEC5475B
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Mar 2024 19:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfG88AeSLL6gUy6aMIaENKAf7JSvOmSWd0mGxJFmiqE=; b=VBxhnojESUdxMs
	yer5PiR0Yl9ByIA52wB6yYsr80YiZRR4hFFx2NdajDOykZ8/BIEymA0GpFB496EKyhur6//e9WZX7
	OVd+JPXIkFoKWfuxkQzn44gEIEavuBwrX18QSR3G5adnd1jL4hsFTeqY9U2RNngG5Xg/anp9unreu
	VtzXG2dt8rfe43F0T/1RuJeTgX/gxoAYInTBxOp59LTwfDySM0ySBRnuDrOASCOpFsYUMjX594zYq
	CYKGysmISm4WYsl9uiBH9o17vAUOEb46XN0ClWUonJYBLZY9TGmXva+Otr80FVh8PI+/Zbnv1UQwT
	DXYDZQjzwHjei/krnoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhwgY-00000001aUs-47CU;
	Wed, 06 Mar 2024 19:12:14 +0000
Received: from mail-am7eur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260e::601] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhwgV-00000001aTk-3mW5
	for linux-i3c@lists.infradead.org;
	Wed, 06 Mar 2024 19:12:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLb+xEhAc0tqgkoUZQkqeq4k27eFX1bh2oJp9JMlKszjFi8uhPdXkX4dNxRYeVi0R6bVMVnW1tF/SohPSaiayCgSY2YWrjpPLDLgc/xu1LwYp6MKqckAnDtlOzrkqT2XKqqLLZYeZf3469AJkKNDMWiFMZPu+zr4nPBtAzqcJRETBYsOpCPtqI3Y1vbqdRlv5i0fH8n8dY6Mwx23wA6auCjwA+/egSDdHKV2TgjW5H2+Di2E3WDUQv/9U2Kz13x9Ap8uiPRVQOp+6uX3WQJeLMaxwHvKW+QaU+rHF6yzUdKwvZulFUUcT82x/3UKy3+CbDCxTlBnDzdbkv/amHLFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5VrlgSXLW00+KPPzs7+fLDHOjJYYXVUkqJlaaq1Umo=;
 b=c9FnWc/Ghnj1qufBolpvupzi79AI+a3ZwUtBzpauH1IwgwgTELNGzPKiQ1UgMApoOWsx1DZjViJFVPTroAr+ifpoAEXqwdxeExeLAKM2NDvhKVUl5yGsfT5aYtm1lJeij0KOFCWWxHF32sQcULoHazn4dm5qEkBy6J261KbDjSWHGNMwhra+/YpGYd+qN41iv9FmNIZ8JV836f6GAQtr816WodDYBNF2LuVjn3oz1oMSER8SGL4sEt3P0ubVXZvJqzNXiP/Q/nrtkzHj+2zfIpNFQ9d7hMBrrkr4d/xamFQydJUuBDUKM/EP/64rTip0xeDYxnRAwEs92DGO+K4SiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5VrlgSXLW00+KPPzs7+fLDHOjJYYXVUkqJlaaq1Umo=;
 b=adDmdDZMOQaf46Pwo+2El6KXuryCG65MAqRtAzEwux57UgVnFwPO1WTf/rG99BTy81OKv82DccCaLhHTxg0QX3uzxaoVAHH4oAdsINgKxLwwFaXbLUw4LegISy3mPWfguCiefkHD9LAIAPcom0ZL5+F6cJRVZgCodUsVowBBva0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6921.eurprd04.prod.outlook.com (2603:10a6:10:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Wed, 6 Mar
 2024 19:12:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6%3]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 19:12:05 +0000
Date: Wed, 6 Mar 2024 14:11:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>,
	"joe@perches.com" <joe@perches.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"zbigniew.lukwinski@linux.intel.com" <zbigniew.lukwinski@linux.intel.com>
Subject: Re: [PATCH v7 5/8] i3c: target: add svc target controller support
Message-ID: <Zei//Si8TzoYBLMF@lizhi-Precision-Tower-5810>
References: <20240205233326.552576-1-Frank.Li@nxp.com>
 <20240205233326.552576-6-Frank.Li@nxp.com>
 <SH0PR01MB08410A70ABB956DF9DD4DE25F921A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <ZeirpIpcsPuBAiIR@lizhi-Precision-Tower-5810>
 <SH0PR01MB0841C4D6B76DE99A789312BEF921A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
Content-Disposition: inline
In-Reply-To: <SH0PR01MB0841C4D6B76DE99A789312BEF921A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: f6752a51-919d-4de3-b7fe-08dc3e114fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l11F5T+TGZUKP7mDfWL13u17jiNTHiXRrzvz9ZN1UUc3cK8u7Bg2ltxU93dPCyILfNkibND+TxSsbtWr87lFEtLyKrGDPLFZXBNHypbIbf8HcI+yn63600knUCggDx4rAnGBWkbW7laH/awSZJ9UmUZ5fTCfPNJ1cYTH7zIrtO/vYT7ui3At7GjO6Ku+vGPY3s3zj1MMGisVmOSFIB3bBim+YAQC7RLLE/sDMuZuAEXHTXVU6vSLRtJyiYK+ve0oRmEvUjNiyN2ERA4/NQ0ztFYwR61JvGGZbk0HBFJrEDHTzx94cT/WGAr0SFnm6b6ONj2mswc4HPI0Byg84DRFsdQU3Ct1tGk/JPYBSlmsAhayc5D8e5itSmnPUaNg07jRZ9V2rWN6ESUY3uK7P23/Jq/KQeqT6cBq/t0EV7UUOJAYEvhJ/A8B83WyGiBLQzsP7RBaQkOARRIoceXIDpYqe3DAfHaoDS+QA1ceSPVp1be1ZS/BO9T4DGJCz0qTSWdglT9qBzCCVv20nezjw+MyEhymtDxU8FDKP95jTTthD4L7GxpQxqvyOihHgrMgdtvSO+DFeahoGA9C8CLXrcMO8FuVjrJ5Pz/vvOIYttutxvAufplN3RW3Kyu5TVCPt7AUwsBaP//hKVb74p/8hDsnnL+qHDXTQk0xF+t/Zv02PCOeZKx1b2Qy6zfJCnoPLtStmVFRbzq/BiQrLeXsbBaxi30ePlkOvKPVw4Nl4KXyH+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c0t4jPpr1cTvK714Vo73BI+X7gqINhqmVP97sHgnZ16IqLjBp8I6MjgK6FHG?=
 =?us-ascii?Q?UgaTrQ7wdR6e1PxhrXPRkeL67gLTxkttVPxeR7RJIE+6002xHrViwzxgI5Ez?=
 =?us-ascii?Q?UVmlmDQvjcIo8iRB6J1/o8mgai5mNHaf+eYnkXY8qybazuaUJdqT1ejYrW6z?=
 =?us-ascii?Q?o2BECwiljvCjp9zdMdKDDX/SHs03DJmxBvoo3/sA/FBMfw+PWpqIsAXtzU66?=
 =?us-ascii?Q?Rrg2Le9T/T8zEyXW0knZjcGgaXeVhuy5QFOy0tyJ1euNOcc289oc+Vbd/fiH?=
 =?us-ascii?Q?1WKelW/OIYV0yfeF02bXyNv3AP/KFDbvAnGGAXpabrDuPRgMbWk1lsYgmU4C?=
 =?us-ascii?Q?/8mraZ8cb89/yXH+se6KznTNYAYfHkpSNNGIp7mcUKWzkU57h6I56xWOq65K?=
 =?us-ascii?Q?m9Yz64sEd3Ib82JQ0GfUfBcn13pehRh0dRP58MPkQWz9RZSFRqpCL6O5/HIx?=
 =?us-ascii?Q?0tOP3PIzfcsCgGV/7y4NPUosMN/GYqf/+F8DB2WCTb451v9DEyP4s7iEv6v9?=
 =?us-ascii?Q?ayduQoN2HMlZYNImJ3g4AnDPGEtzKO4PkciaK5fvgDAPzcEpiq5KVqYJ8/hN?=
 =?us-ascii?Q?JHkcnaG5jH5VjFwtG0Og4oXdZlkN+2uAx0sk4kDABQO1Nn2lWEjMF4yv+iEK?=
 =?us-ascii?Q?G2sNpYAY2SjnixK9388FemLXPpYcTNn6eKKy6BkWuM6+8YhMxzITLbtLk5TB?=
 =?us-ascii?Q?mxzG8TMKnVDAXpyumBk3v+H8oqH6rTA4pfCumHSy6aLatoCP4sLVQHlL4AID?=
 =?us-ascii?Q?IB2Xvq4qeN42zZC3DZZJ3YRJy/ub60iy9DWwjYT+uPA34WTg88PvEYvm566+?=
 =?us-ascii?Q?/rJ4tbH9eXqtviQT9HChX1XJgITzkN1JDiSzrrKeP/DFtEcwDyyEP7PiTFjU?=
 =?us-ascii?Q?iBcVsVTdWqKo/+5plVD7omVTCRzlJJhPV1Zx1PbA0I18JDqQgu/uMXZKczDL?=
 =?us-ascii?Q?i84rGrUaZhqC35yEKkEMXeC7gzxF9Th6HmmDEaArogJkfC6lozLBbvWYQrIA?=
 =?us-ascii?Q?l5XM8wqC92mXNX3XEN3JrJID/aOhbQU0KKbKgDWS1eR4khZsqom94PiDdqL+?=
 =?us-ascii?Q?vBubPyyOzX319BhItnztooZdREC7EfgnPMxpZpv3saxdzoDUjgV8e9zPBgKr?=
 =?us-ascii?Q?jnMCB8aXKU9EtuBsTRJHVZF+eqpcrmhlEucNpuE6bWu4/sYys+02ZUs3iTuQ?=
 =?us-ascii?Q?GZPFSaXALMxxWnHMwjPZNWg+0zIBIjzSKr2AB6dQouGqoBsQc4QBZ88wtpQ/?=
 =?us-ascii?Q?HBO6Q6ReGsWAboz9lDMnPmjWm89uVTIViGZFjBjyCL3BCCvgRMe9ktzNTpEE?=
 =?us-ascii?Q?kpKb+GdtqOvSTjwhrVkNO+pTCv2l9Q3AQsrcbD2As/yMlURvlr7E8HrkE9r/?=
 =?us-ascii?Q?6Xx/IRFVLbdyVxHrMfG00SvGU7QWoguvnfRIixgCq93XtfGP0a6ZPq65N8Wv?=
 =?us-ascii?Q?1NjEJuGWwtIM/wsVmKaYWKFRgWVWI/lYYRPBC2wcajnnoxCqB1csoN+l0LoK?=
 =?us-ascii?Q?KSVqR8ctpA8KWecnf8BLrkkx+jN9qcdabPEcj57qKF9gRzj0nKrURshlbWWz?=
 =?us-ascii?Q?Y+xh0GPoAWbjl7Tg3YLycxkVFMzuLP3k9GzjB2sL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6752a51-919d-4de3-b7fe-08dc3e114fe5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 19:12:05.7483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHjs3rgF81fVJ3MTrYHVH0NOdOX5n+sXZvnMpY/Ran0Xsuu28WmZbVad//9ulFvqC2Scis3ttK7jKEbz50hF5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_111212_043590_48628BED 
X-CRM114-Status: GOOD (  32.46  )
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

On Wed, Mar 06, 2024 at 06:10:30PM +0000, Joshua Yeong wrote:
> 
> > -----Original Message-----
> > From: Frank Li <Frank.li@nxp.com>
> > Sent: Thursday, March 7, 2024 1:45 AM
> > To: Joshua Yeong <joshua.yeong@starfivetech.com>
> > Cc: alexandre.belloni@bootlin.com; conor.culhane@silvaco.com;
> > devicetree@vger.kernel.org; gregkh@linuxfoundation.org;
> > ilpo.jarvinen@linux.intel.com; imx@lists.linux.dev; jirislaby@kernel.org;
> > joe@perches.com; krzysztof.kozlowski+dt@linaro.org;
> > krzysztof.kozlowski@linaro.org; linux-i3c@lists.infradead.org; linux-
> > kernel@vger.kernel.org; linux-serial@vger.kernel.org;
> > miquel.raynal@bootlin.com; robh@kernel.org;
> > zbigniew.lukwinski@linux.intel.com
> > Subject: Re: [PATCH v7 5/8] i3c: target: add svc target controller support
> > 
> > On Wed, Mar 06, 2024 at 04:01:17PM +0000, Joshua Yeong wrote:
> > > Hi Frank,
> > >
> > > > -----Original Message-----
> > > > From: linux-i3c <linux-i3c-bounces@lists.infradead.org> On Behalf Of
> > > > Frank Li
> > > > Sent: Tuesday, February 6, 2024 7:33 AM
> > > > To: frank.li@nxp.com
> > > > Cc: alexandre.belloni@bootlin.com; conor.culhane@silvaco.com;
> > > > devicetree@vger.kernel.org; gregkh@linuxfoundation.org;
> > > > ilpo.jarvinen@linux.intel.com; imx@lists.linux.dev;
> > > > jirislaby@kernel.org; joe@perches.com;
> > > > krzysztof.kozlowski+dt@linaro.org;
> > > > krzysztof.kozlowski@linaro.org; linux-i3c@lists.infradead.org;
> > > > linux- kernel@vger.kernel.org; linux-serial@vger.kernel.org;
> > > > miquel.raynal@bootlin.com; robh@kernel.org;
> > > > zbigniew.lukwinski@linux.intel.com
> > > > Subject: [PATCH v7 5/8] i3c: target: add svc target controller
> > > > support
> > > >
> > > > Add Silvaco I3C target controller support
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >
> > > > Notes:
> > > >     Change from v2 to v3
> > > >     - fix build warning
> > > >
> > > >  drivers/i3c/master/Makefile         |   2 +-
> > > >  drivers/i3c/master/svc-i3c-main.c   |  35 +-
> > > >  drivers/i3c/master/svc-i3c-target.c | 776
> > >
> > > I think putting target mode files under "master" might not make sense.
> > > We might have to consider that we may have a "secondary master" mode.
> > > Some other ways of splitting or handling of target mode is needed here.
> > 
> > I think name 'master' is not good here. Previously only support 'master'
> > mode, it should be fine. Now many controller are dual mode.
> > 
> > And I3C spec use 'controller/target' instead of 'master/slave'. I think
> > 'controller' as master are quite confused. It can be master controller and slave
> > controller.
> > 
> > Anyway, slave/master may share some code and resource, even only one file.
> > 
> > So far, I think it is fine put under master now. we can rename 'master'
> > later when more dual mode controller added.
> > 
> > Frank
> 
> I am currently working on secondary-controller mode. I would like to explore if 
> we can have a different way to implement various modes.

Second controller should be more similar than master mode.

> 
> I am guessing that the current inspiration is coming from the existing i2c 
> framework.

i2c slave mode is quite simple. The major problem is that the latency to
fill FIFO. Modem async transfer queue should be better handle it. When
host START transfer, fetch one transfer from queue. 

There are only a simple I2c slave test driver in kernel. I think not much
people use it.

> 
> However, I am thinking of having a more generic function to replace the way how 
> we register the i3c driver. (existing 'i3c_master_register' or 
> 'devm_i3c_target_ctrl_create' from yours) Maybe along the line where we can have
> all the modes set in a struct and return to the i3c framework. So we only need 1
> API to register all the different modes instead of having one each.

You can try, but it is not easy. Like USB, PCIE-Endpoint, all was use
different register for difference mode. 

By the way, rename 'master' as 'controller' should be good idea. A I3C IP
can support (master, slave and second) controller.

I think the folder name should not block issue for this patch series.

Frank

> 
> > 
> > >
> > > ...
> > >
> > > > +
> > > > +#define I3C_SCONFIG	0x4
> > > > +#define   I3C_SCONFIG_SLVENA_MASK	BIT(0)
> > > > +#define	  I3C_SCONFIG_OFFLINE_MASK	BIT(9)
> > > > +#define   I3C_SCONFIG_SADDR_MASK	GENMASK(31, 25)
> > > > +
> > > > +#define I3C_SSTATUS	0x8
> > > > +#define	  I3C_SSTATUS_STNOTSTOP_MASK	BIT(0)
> > > > +#define	  I3C_SSTATUS_STOP_MASK		BIT(10)
> > > > +#define	  I3C_SSTATUS_RX_PEND_MASK	BIT(11)
> > > > +#define   I3C_SSTATUS_TXNOTFULL_MASK	BIT(12)
> > > > +#define	  I3C_SSTATUS_DACHG_MASK	BIT(13)
> > > > +#define	  I3C_SSTATUS_EVDET_MASK	GENMASK(21, 20)
> > > > +#define	  I3C_SSTATUS_EVDET_ACKED	0x3
> > > > +#define	  I3C_SSTATUS_IBIDIS_MASK	BIT(24)
> > > > +#define	  I3C_SSTATUS_HJDIS_MASK	BIT(27)
> > > > +
> > >
> > > There is couple of space formatting here that requires to be fixed.
> > >
> > > Cheers,
> > > Joshua

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
