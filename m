Return-Path: <SRS0=fyUz=UD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91AAC282CE
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Jun 2019 13:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EDF72189F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Jun 2019 13:47:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ML1rl7Fe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EDF72189F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMuw7/xY0Ajk9mGTFh5kPe+iyFy2Bd1zy1GbWGNRB5o=; b=ML1rl7Feev3zaA
	EdziaEC6stWUUT44GpzyjgNQJ499yz2z8J6yV3kCQs1UrcdF8+kzxErtoBzRLX+L3E/zSGzNOwkZw
	hmofwt+rNS9sLbb59y0D41py8eLjxMCYRzxWrjIq8tqZZsURcFJibHGI9QteXJoadaAT+vng5sihL
	8ruCsXsrhzhMJvMyrrVspQD6mop6vYCroUV8sjdUX0nNlyxJAk13jdttdDRbDVFwLu1Dmtl1HY2Nh
	sWyXT76pkbmt23snvxf1l/ZuHDYuDKCSOUQXdkzj9HsAl6UT1QxVHD/TIpFkdPFzi0rLNvNUISLHF
	g1jurURKVNdWfl55zh4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY9mq-0004qM-W2; Tue, 04 Jun 2019 13:47:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY8Wg-0004LS-52; Tue, 04 Jun 2019 12:26:51 +0000
X-UUID: e6779d9676684e4f85401e7848fa697e-20190604
X-UUID: e6779d9676684e4f85401e7848fa697e-20190604
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1980184098; Tue, 04 Jun 2019 04:26:44 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Jun 2019 05:26:43 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 4 Jun 2019 20:26:41 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Jun 2019 20:26:40 +0800
Message-ID: <1559651200.5871.2.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] i3c: master: Add driver for MediaTek IP
From: Qii Wang <qii.wang@mediatek.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 4 Jun 2019 20:26:40 +0800
In-Reply-To: <20190604095858.38ed9a28@collabora.com>
References: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
 <1559533863-10292-3-git-send-email-qii.wang@mediatek.com>
 <20190604095858.38ed9a28@collabora.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_052650_202108_4602523A 
X-CRM114-Status: GOOD (  13.24  )
X-Mailman-Approved-At: Tue, 04 Jun 2019 06:47:35 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
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

On Tue, 2019-06-04 at 09:58 +0200, Boris Brezillon wrote:
> On Mon, 3 Jun 2019 11:51:03 +0800
> Qii Wang <qii.wang@mediatek.com> wrote:
> 
> 
> > +static int mtk_i3c_master_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct mtk_i3c_master *master;
> > +	struct resource *res;
> > +	int ret, irqnr;
> > +
> > +	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> > +	if (!master)
> > +		return -ENOMEM;
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "main");
> > +	master->regs = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(master->regs))
> > +		return PTR_ERR(master->regs);
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dma");
> > +	master->dma_regs = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(master->dma_regs))
> > +		return PTR_ERR(master->dma_regs);
> > +
> > +	irqnr = platform_get_irq(pdev, 0);
> > +	if (irqnr < 0)
> > +		return irqnr;
> > +
> > +	ret = devm_request_irq(dev, irqnr, mtk_i3c_master_irq,
> > +			       IRQF_TRIGGER_NONE, DRV_NAME, master);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Request I3C IRQ %d fail\n", irqnr);
> > +		return ret;
> > +	}
> > +
> > +	ret = of_property_read_u32(pdev->dev.of_node, "clock-div",
> > +				   &master->clk_src_div);
> 
> You say in one comment that this clock divider is fixed in HW but might
> change on a per-SoC basis. If that's the case, you should get rid of
> this clock-div prop and attach the divider to the compatible (using an
> mtk_i3c_master_variant struct that contains a divider field).
> 

ok, I will attach the divider to the compatible.

> > +	if (ret < 0)
> > +		return -EINVAL;
> > +
> > +	spin_lock_init(&master->xferqueue.lock);
> > +	INIT_LIST_HEAD(&master->xferqueue.list);
> > +
> > +	if (dma_set_mask(dev, DMA_BIT_MASK(33))) {
> > +		dev_err(dev, "dma_set_mask return error.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	master->clk_main = devm_clk_get(dev, "main");
> > +	if (IS_ERR(master->clk_main)) {
> > +		dev_err(dev, "cannot get main clock\n");
> > +		return PTR_ERR(master->clk_main);
> > +	}
> > +	master->clk_dma = devm_clk_get(dev, "dma");
> > +	if (IS_ERR(master->clk_dma)) {
> > +		dev_err(dev, "cannot get dma clock\n");
> > +		return PTR_ERR(master->clk_dma);
> > +	}
> > +
> > +	master->clk_arb = devm_clk_get_optional(dev, "arb");
> > +	if (IS_ERR(master->clk_arb))
> > +		return PTR_ERR(master->clk_arb);
> > +
> > +	ret = mtk_i3c_master_clock_enable(master);
> > +	if (ret) {
> > +		dev_err(dev, "clock enable failed!\n");
> > +		return ret;
> > +	}
> > +
> > +	master->dev = dev;
> > +	platform_set_drvdata(pdev, master);
> > +
> > +	ret = i3c_master_register(&master->mas_ctrler, dev,
> > +				  &mtk_i3c_master_ops, false);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to add i3c bus to i3c core\n");
> > +		mtk_i3c_master_clock_disable(master);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
