Return-Path: <SRS0=6ko9=V3=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CB1C433FF
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Jul 2019 07:21:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E540205F4
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Jul 2019 07:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bVa4+CVr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E540205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Inez/pX9DP2/ZSM5Z9vfNxNeDm9MlalSardud07v8p8=; b=bVa4+CVrx8Siut
	jgy/Kpif0+8tX8obVflXZ5JaLz5Kdj2WHV7rjyO+0qHtMfoCz7z6+d2vdRoCnnxVEda164zhcne28
	+OD//cMeoSZCMPm4QyQUHdsdrpEpgk2szepNuculL0Z0VNAEWAfS0tCPcsbXgbekQ2rpyHHkYXQrD
	PbabTL27LiDmxRFJJOO2MLcXqVLuaSxiLP0mnaKs5ijjNLsZK4VA4FXeOa8HVSdfilAGulHPBy8X+
	7U+VO2y2k0NqCnv0G9reju8GFS30PPxx6RN2/CFvQPzfAB/bCIfL4tW9Vfoa0HfVzzeJEk8qpEjC1
	j8ZLErSJhoB+lypDt6gA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsMRX-0003M6-HI; Tue, 30 Jul 2019 07:21:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsH21-0001XW-1G; Tue, 30 Jul 2019 01:34:26 +0000
X-UUID: f27e081685894299937c484349ff0376-20190729
X-UUID: f27e081685894299937c484349ff0376-20190729
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1882569551; Mon, 29 Jul 2019 17:34:18 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 29 Jul 2019 18:34:16 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 30 Jul 2019 09:34:13 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 30 Jul 2019 09:34:13 +0800
Message-ID: <1564450453.24702.14.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Document MediaTek I3C master
 bindings
From: Qii Wang <qii.wang@mediatek.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 30 Jul 2019 09:34:13 +0800
In-Reply-To: <20190727111859.315994c3@collabora.com>
References: <1562677762-24067-1-git-send-email-qii.wang@mediatek.com>
 <1562677762-24067-2-git-send-email-qii.wang@mediatek.com>
 <20190724202119.GA26566@bogus>	<1564190613.24702.11.camel@mhfsdcap03>
 <20190727111859.315994c3@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 91A1554D3BC24F029BD720EAFB2775A8A7F8762EFAD65B4F447638B10A285CF22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_183425_085459_F0F079FF 
X-CRM114-Status: GOOD (  21.34  )
X-Mailman-Approved-At: Tue, 30 Jul 2019 00:21:04 -0700
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
Cc: mark.rutland@arm.com, Rob Herring <robh@kernel.org>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 leilk.liu@mediatek.com, bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 liguo.zhang@mediatek.com, linux-mediatek@lists.infradead.org,
 xinping.qian@mediatek.com, matthias.bgg@gmail.com,
 linux-i3c@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sat, 2019-07-27 at 11:18 +0200, Boris Brezillon wrote:
> On Sat, 27 Jul 2019 09:23:33 +0800
> Qii Wang <qii.wang@mediatek.com> wrote:
> 
> > On Wed, 2019-07-24 at 14:21 -0600, Rob Herring wrote:
> > > On Tue, Jul 09, 2019 at 09:09:21PM +0800, Qii Wang wrote:  
> > > > Document MediaTek I3C master DT bindings.
> > > > 
> > > > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/i3c/mtk,i3c-master.txt     |   48 ++++++++++++++++++++
> > > >  1 file changed, 48 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> > > > new file mode 100644
> > > > index 0000000..d32eda6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> > > > @@ -0,0 +1,48 @@
> > > > +Bindings for MediaTek I3C master block
> > > > +=====================================
> > > > +
> > > > +Required properties:
> > > > +--------------------
> > > > +- compatible: shall be "mediatek,i3c-master"  
> > > 
> > > Needs to be SoC specific.
> > >   
> > 
> > We hope that the SOCs will use the same driver and try to avoid big
> > changes. If there are inevitable changes in the future, then we will
> > modify the compatible to be SoC specific. cdns,i3c-master.txt is not SoC
> > specific either.
> 
> The cadence case is a bit different I think. When the driver was
> developed there was no SoC integrating this IP. I guess Mediatek knows
> already which SoC(s) will embed the I3C master block.
> 

ok, I will modify it as "mediatek,mt8183-i3c".

> > 
> > > > +- reg: physical base address of the controller and apdma base, length of
> > > > +  memory mapped region.
> > > > +- reg-names: shall be "main" for master controller and "dma" for apdma.
> > > > +- interrupts: the interrupt line connected to this I3C master.
> > > > +- clocks: shall reference the i3c and apdma clocks.
> > > > +- clock-names: shall include "main" and "dma".
> > > > +
> > > > +Mandatory properties defined by the generic binding (see
> > > > +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> > > > +
> > > > +- #address-cells: shall be set to 3
> > > > +- #size-cells: shall be set to 0
> > > > +
> > > > +Optional properties defined by the generic binding (see
> > > > +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> > > > +
> > > > +- i2c-scl-hz
> > > > +- i3c-scl-hz
> > > > +
> > > > +I3C device connected on the bus follow the generic description (see
> > > > +Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> > > > +
> > > > +Example:
> > > > +
> > > > +	i3c0: i3c@1100d000 {
> > > > +		compatible = "mediatek,i3c-master";
> > > > +		reg = <0x1100d000 0x1000>,
> > > > +		      <0x11000300 0x80>;
> > > > +		reg-names = "main", "dma";
> > > > +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
> > > > +		clocks = <&infracfg CLK_INFRA_I3C0>,
> > > > +			 <&infracfg CLK_INFRA_AP_DMA>;
> > > > +		clock-names = "main", "dma";
> > > > +		#address-cells = <3>;
> > > > +		#size-cells = <0>;
> > > > +		i2c-scl-hz = <100000>;
> > > > +
> > > > +		nunchuk: nunchuk@52 {
> > > > +			compatible = "nintendo,nunchuk";
> > > > +			reg = <0x52 0x0 0x10>;
> > > > +		};
> > > > +	};
> > > > -- 
> > > > 1.7.9.5
> > > >   
> > 
> > 
> 



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
