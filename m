Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A553C54E66
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Mar 2024 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVAvaXJjO+c+J5D8eovOySVleEAsK7pIJBvJtc+fbF8=; b=T8gp/ZLtucLyIv
	xUUhYAU8PqKMZjUXR0AeT8PsdPR60CyinvuYgQ411k13P9RvrCAH8DKXvECSnsThWb6I/bqJFjvAI
	5adBWGE3qJgzjeKM3ZtSqPvXp90auFNu7f2IaFo5cgA04ILPz37udpUhPAN/lbW81PxDiQ8crjgPL
	cJds045BvZBo7PjfZPWwvhHpp69uOSqUDjvuwD2ktg2VSns9cfF6J0IHHQA3dTmDxD4KMKAnjvUk0
	e/giHc6+ohQau/W9io5cjpLClYRLKvkl6aUm0XsbOKM8foTYJvL23HXTs1wslmZWWkSoAebJNQPH4
	UarhQOgmnWxn2P9R1JVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2a9-0000000H4gl-17Jq;
	Fri, 15 Mar 2024 08:06:25 +0000
Received: from mail-bjschn02on20704.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::704] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2a5-0000000H4dW-14vS
	for linux-i3c@lists.infradead.org;
	Fri, 15 Mar 2024 08:06:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAbStCcFrFMZyP+SrMWW23JGbc3yWTJOQ0DVAVfPJi2SVEqzESqvubODuddKAX+wGEdg6uph39hL/rUKhjY6wviwYxwWSn63TMjXJQ55gVSnkTRErCIMrysi75QIT9rOFpnuVkInWcGyGCzZRUiif1k1MryBlD2p1bdu++nZVBugtIL0xVdzHg+8seFdoqzKtHL3RSxViA4+KHmADuW8a6alZajzY4JqSi2fH0pRPGoUjlv8i9RfqfEzNnT+FwW9J4oc0dgMcc67it8CJwPreQittE59ELWJaWFliYQSILROaTkNLwoHGWER8SAgKFRqJMlp5mcRacq7pRUkvzjseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muRXkRjsYyKJcNcIW7cgyLFD22BgLYqO3kQFrknL8/E=;
 b=jqOzUmo4d8SMArDyvHauPrguATG0gF2omsg0Xw61r92OBJBu3cu35E7PyMPZtvi8g8hek3YdPrgG82+BrPW7qxIc9C49twtBt0zh3YdZLSLckM+Cr5+UiP8XxFY7zyexMK8/V55AfL82mgpi6jM3tzVO1ZKZReQRtuXAvsDYo46mYZQx4XmZvjsh/3ND98Jn8PVSd96wowGwZY3CocXBMt7rpwfka7kysDk5vqDQ2MOZ6yxV5dgCxJAUbEPwUawz8xFuqTU8kdku7Mus+fAy7I65ntY9KxpK8Ksws3XALWmSieO3tBXXH9cspphlhApSw/n2TF8lVGzJZ9XQ2mOBnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0459.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 08:05:55 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::e0a:f88a:cad1:dc1c]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::e0a:f88a:cad1:dc1c%7]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 08:05:55 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "andersson@kernel.org" <andersson@kernel.org>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>
Subject: RE: [PATCH v1] i3c: master: Enable runtime PM for master controller
Thread-Topic: [PATCH v1] i3c: master: Enable runtime PM for master controller
Thread-Index: AQHabmvVHa0TJLr8CkqxZnQVcFD1ubExREqAgAc9zsA=
Date: Fri, 15 Mar 2024 08:05:55 +0000
Message-ID: <SH0PR01MB08419B8683E8F2DD05A791BBF928A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20240228093407.4038399-1-quic_msavaliy@quicinc.com>
 <b61f5f4a-7931-411d-9519-bbff1b7fd6f9@quicinc.com>
In-Reply-To: <b61f5f4a-7931-411d-9519-bbff1b7fd6f9@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0459:EE_
x-ms-office365-filtering-correlation-id: ad174501-93bd-4792-6f17-08dc44c6bd6d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 10aSS26U5MYPSe8mJqc9zxYY+zOTiYgjUzs0eOdNyBhQ73gj+/2HKs5GJcSBPAwAo9yejRpZZsPRNXegXn/ipMgjWdOf7seQteEVknpfQxC1KUm/oSVgtNv8YAUpPRd8x+f9tdC/aN1NQGPG4U54md4oPmZfMhEapXanB8ZVQszc7Dfr2yyVrPeDXmSgE9kk2IRl7svCYMuYEspGx9+26VJzl8cp2g56QtUAEz4FKmG9U66BDP6oSitU9h613puhqyHvrWyvs0r5FLLFhLAzsCA/+D9JDJUPXrHS6Hrt351AzIzAZ8qdy4gnSnK2NSt/9Q2xr1DJjutYu0GkwurBIYEAwWlZ6dHPKPo2em5sfklhdrcrL45hY9dz09uzWJHGcszwymSM8cUM/bX8yIswIo85XFS3M6pnWE93PLi5VA7DRSbCAWi9BVzSceHdiKJWFuTGZcvEl/X3GVVpq2QRFWDIaWaMmVdHjYu4UW5v9gTltlfQkcEBRw1aDQCsl1LkqBlOhQmIubusTxO28mzgm70QpLTlLijgl0pUE7NKP5yjOwkqy9jHq5/61KhDJSzVdnWHTvVHVnQNWwjj5LwZPZYOmotPWtk9AJpSuyP7kT3YgmbUTKDEDJFoi522obvt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?APJZdD4FUyd6kzdLBfQYqN4yuUhy9sUJMKBeLnAXRIUvFot+IrG/OWlPCNuS?=
 =?us-ascii?Q?0qmanwFP2gk4i/SS0Oaf1rej1DUOLZpcpwPcswr2Iapinzh0QvqOAHuiblxq?=
 =?us-ascii?Q?9g0EKtAXCnPOlpD6TbrLRubo8YsziCmqZ1aVjhyvDHv3kupvVQQqJ72Zp/0w?=
 =?us-ascii?Q?Hm6TXnFVQMLhEtW/H7aT2Tr3BNMZp9ZI7wSBFn2cGfuxYJFTZPGEpoTGgKA9?=
 =?us-ascii?Q?0sYNlBaK0FW4gUGhO1rC3f8DRcoFVyqlrzGmNidbxmA3c4ECkodRfi7eKyk1?=
 =?us-ascii?Q?i54OznWNMQuzpTuzg7T4TpR04Qw8GNNBSzu0ZNzaY4rOC694pxEZ0rHhHZEQ?=
 =?us-ascii?Q?Q4mh/wFpVPrOk3lGMFMMi6Ws3cVugF8Zc+U84t37nk5a/FmI2TJEyhMGeiem?=
 =?us-ascii?Q?9F42qZ151TPRktEnQj/z9DaiTPyq+/KOiS3PGSTtvIdxEutJD7wLqe8emEQW?=
 =?us-ascii?Q?bTbPY9VokD+aGZo6gkq8ehmTVmeO70BbdnvwptXK0M2kxuSLZOTJ56U4B8x+?=
 =?us-ascii?Q?TgH3tg6T5H1xmYt8l2SNIQbQEIM8HaPY8ZmgVjqKLEmpqQGtrWjfC1B9ulQ0?=
 =?us-ascii?Q?OCnoLvzx3MJvjjNaUn63OEV1vD/BVS6WcnpwUg0HXiWNXJsMQ6trNa8IHlhk?=
 =?us-ascii?Q?nVmzP5OqghDwbYgK2tNdoX+vQGZq+Obs81Vgca2gSP2FxkLCz0BtM8LsAXZ4?=
 =?us-ascii?Q?/jEvVS5uC0DVnjfJB2t+draKE1VZ3hU1wtkTCuVbsZ4OF+D9uNRbX3UAjiJx?=
 =?us-ascii?Q?H9NIpIX8DvB8XL2ccbgSwP8zEPWnaC2aShw5iaOfQxOMiunlZ+frT1yBYUW5?=
 =?us-ascii?Q?3i9aYgRSke8hHCaK78oWpKMPgXmsTq532q/LRhQ7PC4N7mXnC6eY3NoI7InH?=
 =?us-ascii?Q?acBj1qYu893ujBHID5bGkVhzx6RsAGiNzUA0lB7UgCuKNveQu4i8qxpVQhOI?=
 =?us-ascii?Q?hC7o6Ps8MXsrKwsTlIpTuY5bleNSsTh5gBBYacirxtskVw8AlMMeVsDioZxh?=
 =?us-ascii?Q?ekGJBIvfNhlLH4dibcw8O0x1hLr5D2DbIa9ZRCxmhS87VG6lZL+r/MFVZXsk?=
 =?us-ascii?Q?5NIWe5oVmaT/x/yOOu4ZFXQ4ADdgtfTYxnXDl84CusDzY20+aMOOSxWPaYoK?=
 =?us-ascii?Q?yXtYcbDYCnL7gy2dPfKbkAP4XE3Q1R94q7RdcOK/PeEAUjpHQvA+9pZGrPDo?=
 =?us-ascii?Q?t2BsFNo0cEW3JTOgbgKxFcJJyJpPvKshNIF6Ir63UtFDJisch1h+TExfVt5D?=
 =?us-ascii?Q?WknUczdkqiD23/rXUDnC+36CJ6y5GccMruuouvJwReFWz/tVjBXjSyG9Tzbw?=
 =?us-ascii?Q?uuYZ2mS9nKW48qrSfDhtb+xyi3GVTslwe8w4tEKgczCs0dtgIyFQcpl2I17K?=
 =?us-ascii?Q?QqpiZTiDCAyDZGUZKE8CvRLB65shmgVCB/p1KN2L7wUpIMwnq+j96tbhycin?=
 =?us-ascii?Q?EXjJOIZfz3tOV/aDfzqZCDQZDDEUa1aJH1J4XEo4W5kPwFt4W5iv1hhFr0Mn?=
 =?us-ascii?Q?LK86pHnFIs6qfFO3G7bSz9PgCowGnazKtpy4AtBxvVyPgSS9l9+xgp1TstkI?=
 =?us-ascii?Q?RTWUf23k8dnkKLNN7nGhAjhMO7d4r1/dDLqL5E3ie/QOxYiuZxVQUMEDTWt5?=
 =?us-ascii?Q?4g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: ad174501-93bd-4792-6f17-08dc44c6bd6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 08:05:55.1465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLTBTpcoCahpKjc1ztLO4PbQqnV4w+XthMla5v8RHU1qjzw9JuRnza/t4h/gLeIFQj9wXbGvhWxbCYjsNstsYSyYdzFGe4igPtzZtwDBPLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_010621_423374_E2E78B48 
X-CRM114-Status: GOOD (  24.22  )
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



> -----Original Message-----
> From: linux-i3c <linux-i3c-bounces@lists.infradead.org> On Behalf Of Mukesh
> Kumar Savaliya
> Sent: Monday, March 11, 2024 1:30 AM
> To: alexandre.belloni@bootlin.com; linux-i3c@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Cc: andersson@kernel.org; vkoul@kernel.org;
> manivannan.sadhasivam@linaro.org
> Subject: Re: [PATCH v1] i3c: master: Enable runtime PM for master controller
> 
> A Gentle reminder ! As i was not part of the linux-i3c group before raising this
> gerrit, might not went into right folder.
> 
> On 2/28/2024 3:04 PM, Mukesh Kumar Savaliya wrote:
> > Enable runtime PM for i3c master node during master registration time.
> >
> > Sometimes i3c client device driver may want to control the PM of the
> > parent (master) to perform the transactions and save the power in an
> > efficient way by controlling the session. Hence device can call PM
> > APIs by passing the parent node.
> >
> > Here, I3C target device when calls pm_runtime_get_sync(dev->parent)
> > couldn't invoke master drivers runtime PM callback registered by the
> > master driver because parent's PM status was disabled in the Master
> > node.
> >
> > Also call pm_runtime_no_callbacks() and pm_suspend_ignore_children()
> > for the master node to not have any callback addition and ignore the
> > children to have runtime PM work just locally in the driver. This
> > should be generic and common change for all i3c devices and should not
> > have any other impact.
> >
> > With these changes, I3C client device works and able to invoke master
> > driver registered runtime PM callbacks.
> >
> > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > ---
> >   drivers/i3c/master.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c index
> > 3afa530c5e32..a3dc88974f92 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -13,6 +13,7 @@
> >   #include <linux/kernel.h>
> >   #include <linux/list.h>
> >   #include <linux/of.h>
> > +#include <linux/pm_runtime.h>
> >   #include <linux/slab.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/workqueue.h>
> > @@ -2812,6 +2813,10 @@ int i3c_master_register(struct
> > i3c_master_controller *master,
> >
> >   	i3c_bus_notify(i3cbus, I3C_NOTIFY_BUS_ADD);
> >
> > +	pm_runtime_no_callbacks(&master->dev);
> > +	pm_suspend_ignore_children(&master->dev, true);
> > +	pm_runtime_enable(&master->dev);
> > +

Will runtime pm impact on ibi request from target?

> >   	/*
> >   	 * We're done initializing the bus and the controller, we can now
> >   	 * register I3C devices discovered during the initial DAA.
> > @@ -2849,6 +2854,7 @@ void i3c_master_unregister(struct
> i3c_master_controller *master)
> >   	i3c_master_i2c_adapter_cleanup(master);
> >   	i3c_master_unregister_i3c_devs(master);
> >   	i3c_master_bus_cleanup(master);
> > +	pm_runtime_disable(&master->dev);
> >   	device_unregister(&master->dev);
> >   }
> >   EXPORT_SYMBOL_GPL(i3c_master_unregister);
> 
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
