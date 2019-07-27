Return-Path: <SRS0=KKIm=VY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70607C7618B
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jul 2019 14:11:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B0E12075E
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jul 2019 14:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ChLZNtDo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B0E12075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5A+n57fHvWA4wOktIJ9eP6SZjW7j1ewQ09fHB4b4w8s=; b=ChLZNtDo6NDDkX
	u+/aaUeglsWhJk+l720DP5ItXJVoorCMEhFe3qQGnU6VCms63/X7KaPhrr99AXiOmzkviD/3ABTNC
	4DwSePehb12CD0zDbzdUNIS9z3dRRIKQ7PNHYNDBfdf4elCkk1sHd7sW/fGqokakaoqkJUI26+/m7
	ySx3IHl2Bq9MBwk5lOODESJqDcxAI/wsddf6fRDV5Vp1ZBwkRqV+DpUzxx5TTf+WnSheeVhLuHfjw
	VQlh33co5Eyw3lUlnZMqx+35glVT/NMxNXIPzuSDybMYTvpDEHVwmtEpYmT9TxaAtT/JUs9yMYMkC
	FuFrwhk9dHLHF07jGlcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrNQ0-0003MP-SY; Sat, 27 Jul 2019 14:11:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrBR4-0002sf-FZ; Sat, 27 Jul 2019 01:23:49 +0000
X-UUID: a57b4cb0e36a4fafb7365a208f4c6ce5-20190726
X-UUID: a57b4cb0e36a4fafb7365a208f4c6ce5-20190726
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2017277971; Fri, 26 Jul 2019 17:23:40 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 26 Jul 2019 18:23:39 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 27 Jul 2019 09:23:34 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 27 Jul 2019 09:23:33 +0800
Message-ID: <1564190613.24702.11.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Document MediaTek I3C master
 bindings
From: Qii Wang <qii.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Sat, 27 Jul 2019 09:23:33 +0800
In-Reply-To: <20190724202119.GA26566@bogus>
References: <1562677762-24067-1-git-send-email-qii.wang@mediatek.com>
 <1562677762-24067-2-git-send-email-qii.wang@mediatek.com>
 <20190724202119.GA26566@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3115CDD7324A6A0F4379AC19364C2F37546642D4CAA4C5EC9B050BD991421A8C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_182346_527655_100942CD 
X-CRM114-Status: GOOD (  17.50  )
X-Mailman-Approved-At: Sat, 27 Jul 2019 07:11:26 -0700
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, bbrezillon@kernel.org, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, liguo.zhang@mediatek.com,
 linux-mediatek@lists.infradead.org, xinping.qian@mediatek.com,
 matthias.bgg@gmail.com, linux-i3c@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 2019-07-24 at 14:21 -0600, Rob Herring wrote:
> On Tue, Jul 09, 2019 at 09:09:21PM +0800, Qii Wang wrote:
> > Document MediaTek I3C master DT bindings.
> > 
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > ---
> >  .../devicetree/bindings/i3c/mtk,i3c-master.txt     |   48 ++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> > new file mode 100644
> > index 0000000..d32eda6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> > @@ -0,0 +1,48 @@
> > +Bindings for MediaTek I3C master block
> > +=====================================
> > +
> > +Required properties:
> > +--------------------
> > +- compatible: shall be "mediatek,i3c-master"
> 
> Needs to be SoC specific.
> 

We hope that the SOCs will use the same driver and try to avoid big
changes. If there are inevitable changes in the future, then we will
modify the compatible to be SoC specific. cdns,i3c-master.txt is not SoC
specific either.

> > +- reg: physical base address of the controller and apdma base, length of
> > +  memory mapped region.
> > +- reg-names: shall be "main" for master controller and "dma" for apdma.
> > +- interrupts: the interrupt line connected to this I3C master.
> > +- clocks: shall reference the i3c and apdma clocks.
> > +- clock-names: shall include "main" and "dma".
> > +
> > +Mandatory properties defined by the generic binding (see
> > +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> > +
> > +- #address-cells: shall be set to 3
> > +- #size-cells: shall be set to 0
> > +
> > +Optional properties defined by the generic binding (see
> > +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> > +
> > +- i2c-scl-hz
> > +- i3c-scl-hz
> > +
> > +I3C device connected on the bus follow the generic description (see
> > +Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> > +
> > +Example:
> > +
> > +	i3c0: i3c@1100d000 {
> > +		compatible = "mediatek,i3c-master";
> > +		reg = <0x1100d000 0x1000>,
> > +		      <0x11000300 0x80>;
> > +		reg-names = "main", "dma";
> > +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&infracfg CLK_INFRA_I3C0>,
> > +			 <&infracfg CLK_INFRA_AP_DMA>;
> > +		clock-names = "main", "dma";
> > +		#address-cells = <3>;
> > +		#size-cells = <0>;
> > +		i2c-scl-hz = <100000>;
> > +
> > +		nunchuk: nunchuk@52 {
> > +			compatible = "nintendo,nunchuk";
> > +			reg = <0x52 0x0 0x10>;
> > +		};
> > +	};
> > -- 
> > 1.7.9.5
> > 



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
