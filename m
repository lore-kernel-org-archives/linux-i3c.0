Return-Path: <SRS0=UgBl=UL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3898C31E47
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Jun 2019 06:12:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C044206E0
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Jun 2019 06:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aHgHTU3l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C044206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qT1hdaKBMlr7Wj5YUBqk5xRapaDL5s2Uxo3wW+U2dX8=; b=aHgHTU3lBVA0Oi
	nxPZTURqi0xHjp6AiFwxlm9ynLqXAWsO1WzSEJfKtL9xiCNpJrTg3jNGd5rrBi0Z3bSyBuvbU4B0P
	BpBjcimfxVn2aNv+oxkggm2wr9X4HR4Rfwdiw/h1VOTvhjKgZZ6PZrJWI7k7JBYN+44nPAmhShkdJ
	z7wvYw/Xd1yldJnIvDNNYJbNDtGVrBvMcbFysRScdqxuBWoPpW+s+v8CdFTJ+ZX5fKiWQij+Byw/x
	a8vJsIQ5D8xKO3CTCgJ9vx2torGbeOGWWyQz01Em11e03vJ4cfIjVIAZ+QDIgXNStwdqlGju9Q+G1
	dF1GIZuy6tt17WpSuhYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hawUN-0002N4-6u; Wed, 12 Jun 2019 06:12:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haftZ-0004OZ-S9; Tue, 11 Jun 2019 12:29:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C1223285914;
 Tue, 11 Jun 2019 13:28:52 +0100 (BST)
Date: Tue, 11 Jun 2019 14:28:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH 2/2] i3c: master: Add driver for MediaTek IP
Message-ID: <20190611142849.43f6d1e4@collabora.com>
In-Reply-To: <1560255922.12217.3.camel@mhfsdcap03>
References: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
 <1559533863-10292-3-git-send-email-qii.wang@mediatek.com>
 <20190604095858.38ed9a28@collabora.com>
 <1559651200.5871.2.camel@mhfsdcap03>
 <1560255922.12217.3.camel@mhfsdcap03>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_052858_105915_0F895514 
X-CRM114-Status: GOOD (  16.54  )
X-Mailman-Approved-At: Tue, 11 Jun 2019 23:12:01 -0700
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

On Tue, 11 Jun 2019 20:25:22 +0800
Qii Wang <qii.wang@mediatek.com> wrote:

> On Tue, 2019-06-04 at 20:26 +0800, Qii Wang wrote:
> > On Tue, 2019-06-04 at 09:58 +0200, Boris Brezillon wrote:  
> > > On Mon, 3 Jun 2019 11:51:03 +0800
> > > Qii Wang <qii.wang@mediatek.com> wrote:
> > > 
> > >   
> > > > +static int mtk_i3c_master_probe(struct platform_device *pdev)
> > > > +{
> > > > +	struct device *dev = &pdev->dev;
> > > > +	struct mtk_i3c_master *master;
> > > > +	struct resource *res;
> > > > +	int ret, irqnr;
> > > > +
> > > > +	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> > > > +	if (!master)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "main");
> > > > +	master->regs = devm_ioremap_resource(dev, res);
> > > > +	if (IS_ERR(master->regs))
> > > > +		return PTR_ERR(master->regs);
> > > > +
> > > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dma");
> > > > +	master->dma_regs = devm_ioremap_resource(dev, res);
> > > > +	if (IS_ERR(master->dma_regs))
> > > > +		return PTR_ERR(master->dma_regs);
> > > > +
> > > > +	irqnr = platform_get_irq(pdev, 0);
> > > > +	if (irqnr < 0)
> > > > +		return irqnr;
> > > > +
> > > > +	ret = devm_request_irq(dev, irqnr, mtk_i3c_master_irq,
> > > > +			       IRQF_TRIGGER_NONE, DRV_NAME, master);
> > > > +	if (ret < 0) {
> > > > +		dev_err(dev, "Request I3C IRQ %d fail\n", irqnr);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret = of_property_read_u32(pdev->dev.of_node, "clock-div",
> > > > +				   &master->clk_src_div);  
> > > 
> > > You say in one comment that this clock divider is fixed in HW but might
> > > change on a per-SoC basis. If that's the case, you should get rid of
> > > this clock-div prop and attach the divider to the compatible (using an
> > > mtk_i3c_master_variant struct that contains a divider field).
> > >   
> > 
> > ok, I will attach the divider to the compatible.
> >   
> I have rechecked your comment, maybe I have misunderstood what you mean.
> "clock-div" changes according to i2c source clock, different project may
> change i2c source clock, The previous dt-binding may be misleading, I
> will modify it.

Is it fixed or configurable? Maybe it should be modeled as a clk
driver. What's for sure is that we shouldn't have this divider defined
in the DT.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
