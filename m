Return-Path: <SRS0=bY92=UM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D09AC31E45
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Jun 2019 07:19:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3FCF2084D
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Jun 2019 07:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q/ghyLKw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3FCF2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFEAr/5swUVBIKb/AVoplRtzybv0ny+3DttD2xjPnIg=; b=Q/ghyLKwZcbp3N
	jurpkUDeH2cxTDhPgfslmLTde0EF3fxDqzjwdbEHpAXpyhJi0Tb0RDj+rcf+RntjIMfL1Hk11IxdS
	UCZ00/SnxA9LgiuuW8LyL8eMrAe5LDDHAin2f5WxGTE7R0P2/ypTLS/CgbMEk9AVGOfyl7NwAE749
	V1VSz0Xlk/nONxLAPymys5jXy11m2YXVrrzrVaZ+4kiWmT2XDvegU40yD2zyZHpVzudF2TYwW3EYD
	jrftCJvw2PAvzoUSuC58gFrNU9EmihY+bLo7ydF7AggMQym9bFG1nUM6fLrdF5IFoTOgMNM08UmJ3
	SKwBR79RAPJpIFh8o1vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbK0h-0005re-Fm; Thu, 13 Jun 2019 07:18:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbFUh-0005uj-UX; Thu, 13 Jun 2019 02:29:43 +0000
X-UUID: 4cee5152e24e4304a66589aa8fbea6bc-20190612
X-UUID: 4cee5152e24e4304a66589aa8fbea6bc-20190612
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1341577592; Wed, 12 Jun 2019 18:29:25 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Jun 2019 19:29:24 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 13 Jun 2019 10:29:22 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Jun 2019 10:29:21 +0800
Message-ID: <1560392961.12217.7.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] i3c: master: Add driver for MediaTek IP
From: Qii Wang <qii.wang@mediatek.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, 13 Jun 2019 10:29:21 +0800
In-Reply-To: <20190611142849.43f6d1e4@collabora.com>
References: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
 <1559533863-10292-3-git-send-email-qii.wang@mediatek.com>
 <20190604095858.38ed9a28@collabora.com>
 <1559651200.5871.2.camel@mhfsdcap03> <1560255922.12217.3.camel@mhfsdcap03>
 <20190611142849.43f6d1e4@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_192939_993390_5B9A48AC 
X-CRM114-Status: GOOD (  16.89  )
X-Mailman-Approved-At: Thu, 13 Jun 2019 00:16:17 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 bbrezillon@kernel.org, leilk.liu@mediatek.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liguo.zhang@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, linux-i3c@lists.infradead.org,
 xinping.qian@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 2019-06-11 at 14:28 +0200, Boris Brezillon wrote:
> On Tue, 11 Jun 2019 20:25:22 +0800
> Qii Wang <qii.wang@mediatek.com> wrote:
> 
> > On Tue, 2019-06-04 at 20:26 +0800, Qii Wang wrote:
> > > On Tue, 2019-06-04 at 09:58 +0200, Boris Brezillon wrote:  
> > > > On Mon, 3 Jun 2019 11:51:03 +0800
> > > > Qii Wang <qii.wang@mediatek.com> wrote:
> > > > 
> > > >   
> > > > > +static int mtk_i3c_master_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct device *dev = &pdev->dev;
> > > > > +	struct mtk_i3c_master *master;
> > > > > +	struct resource *res;
> > > > > +	int ret, irqnr;
> > > > > +
> > > > > +	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> > > > > +	if (!master)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "main");
> > > > > +	master->regs = devm_ioremap_resource(dev, res);
> > > > > +	if (IS_ERR(master->regs))
> > > > > +		return PTR_ERR(master->regs);
> > > > > +
> > > > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dma");
> > > > > +	master->dma_regs = devm_ioremap_resource(dev, res);
> > > > > +	if (IS_ERR(master->dma_regs))
> > > > > +		return PTR_ERR(master->dma_regs);
> > > > > +
> > > > > +	irqnr = platform_get_irq(pdev, 0);
> > > > > +	if (irqnr < 0)
> > > > > +		return irqnr;
> > > > > +
> > > > > +	ret = devm_request_irq(dev, irqnr, mtk_i3c_master_irq,
> > > > > +			       IRQF_TRIGGER_NONE, DRV_NAME, master);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(dev, "Request I3C IRQ %d fail\n", irqnr);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	ret = of_property_read_u32(pdev->dev.of_node, "clock-div",
> > > > > +				   &master->clk_src_div);  
> > > > 
> > > > You say in one comment that this clock divider is fixed in HW but might
> > > > change on a per-SoC basis. If that's the case, you should get rid of
> > > > this clock-div prop and attach the divider to the compatible (using an
> > > > mtk_i3c_master_variant struct that contains a divider field).
> > > >   
> > > 
> > > ok, I will attach the divider to the compatible.
> > >   
> > I have rechecked your comment, maybe I have misunderstood what you mean.
> > "clock-div" changes according to i2c source clock, different project may
> > change i2c source clock, The previous dt-binding may be misleading, I
> > will modify it.
> 
> Is it fixed or configurable? Maybe it should be modeled as a clk
> driver. What's for sure is that we shouldn't have this divider defined
> in the DT.

ok, I have let the clk driver handle it, and remove it in DT and i3c
driver. Thanks!



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
