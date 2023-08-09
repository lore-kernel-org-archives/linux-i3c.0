Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADE5C001E0
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Aug 2023 00:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oq+jnH8vSn+CsdtRy8W0JfBO9hhYETWCheu/QEu8EIg=; b=WdvxJmAO9Qp3Lj
	9OiCGQfKTizRoLGDDZgRTYKUFv54UScImkDR2/JK+JFlbJVCIVmYtUke7ZyvWhNhdS7i3zyVllUmY
	rBjB777lwNJ9urC4485Nu+Q2nqvzPKX+Xoii0V8t+kQ1YGWy6UgcW3dMKyGfoeVonrPIXRrpytYBN
	euQM7ly6pk0l3Av4khoQGVlRIC+iWH5tlqOWpShfcUIAekeoyCEmO7yeubKuQcadmassNWkVwZuT5
	vxeVJ26H5RJ9fBftvEBoTAL3ryhs/4gKnfog1WB3HCXhEQhqXv3V4Gt1oRX+Oev0vQmzP1lZkSfjK
	jvSLHYy2OYs7DCAzfLCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWkN-003iWQ-0F;
	Wed, 09 Aug 2023 00:08:19 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWkJ-003iTp-28;
	Wed, 09 Aug 2023 00:08:17 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 44F1A20187;
	Wed,  9 Aug 2023 08:07:59 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1691539681;
	bh=6qLqCNRICu2NyTPw0KKNnC7PvvAmPBJh4X1ZTZr4EJg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JSjt8XEr7aLccezZ7hz2yq//uMqicALMQqUct/5ULSgUA3i4ObTRVPYDxnZe/5EKl
	 jd6XoDEj7vbaMmHve7uHHPd6Bui58TQCVOB7ccPNDDVQpxECNhtGZe0tQFXgkFnQmU
	 /wiTplEjRbb0MQqlNKhZ2RBFNOvMnp6FJMXq0e3CRQKnjMjvXmwGz6y97+KGORb0c0
	 DWqvqe1SBfZruvFziYTCSpDhc2AAlBIB2G4UeRvCuU4m9o0Qax2gIRrkWK7QaABykD
	 TtLjhK+DxsGRXWTC2nH84pbNII17Xi0TewOULHLnBGZs3YpkgMvlkz9b5Q8qjGo7g2
	 fFBNlMd+JVL7Q==
Message-ID: <d8d577e91779e045d5a2c7d701f65133a15b5d64.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] Add Aspeed AST2600 I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, alexandre.belloni@bootlin.com, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  joel@jms.id.au, andrew@aj.id.au, p.zabel@pengutronix.de, 
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
Date: Wed, 09 Aug 2023 08:07:58 +0800
In-Reply-To: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_170815_903228_F2753043 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Dylan,

> This patch series introduces the necessary changes to enable I3C
> support for the Aspeed AST2600 I3C controller. Specifically, it addresses the
> missing pinctrl configuration and reset control for the I3C
> functionality.

+1 for the pinctrl changes for the I3C1 and I3C2 controllers (I'll
review and ack separately). I have been testing on I3C3 and up, but just
not with the HVI3C on 1 & 2, hence no pinctrl definition there.

However, I don't think the other two are needed.

For 2/3 and 3/3, you're adding a reset control for the global register
block within the per-controller driver, but we can already do that on a
global basis with the existing syscon device. Hence this earlier change:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mfd/syscon.c?id=7d1e3bd94828ad9fc86f55253cd6fec8edd65394

For this, I have:

    &i3c {
        i3c_global: i3c-global {
            compatible = "aspeed,ast2600-i3c-global", "simple-mfd", "syscon";
            resets = <&syscon ASPEED_RESET_I3C_DMA>;
            reg = <0x0 0x1000>;
        };

        i3c2: i3c-master@4000 {
            compatible = "aspeed,ast2600-i3c";
            reg = <0x4000 0x1000>;
            clocks = <&syscon ASPEED_CLK_GATE_I3C2CLK>;
            pinctrl-names = "default";
            pinctrl-0 = <&pinctrl_i3c3_default>;
            interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
            aspeed,global-regs = <&i3c_global 2>;
            status = "disabled";
        };

        /* ... */
    };

- with no changes needed to any bindings. I haven't needed any other
resets; are there per-controller resets specified in the HW docs you
have?

Does that work for you? If you'd like to test, feel free to use my
sample dts at:

  https://github.com/CodeConstruct/linux/commit/05cac24705fa62d2176ecbbbf15d955cfe86e753

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
