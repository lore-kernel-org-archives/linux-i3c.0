Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873C5CA5FA5
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 20:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rukbCo55nEtdcclZSYuW8xvtAO6DpYv+GMkTTvj+NyU=; b=1vXUaqlTxBI1SB
	Bd/sQ3D1PSEdOyvs5OGUB9a047+0vwNScTnpyq+lzKzRM3w5qWahZhZFIeX4b24y2raSDm1cOmKnD
	3dZBvm/Xq17Q4j/9UT6hKSO3j68w7Tnn5SI/7KC/rsc191AkRAhDlj8ZszCl3kjL6SV20neM55O2w
	X7zYz3eidmhSfpbkC0gtdVnk7cPmTqs4voGFezR67+Z2ah+Vkn0RwFFqxGMB6wp+yrbimkRVhmqbS
	EL/YS5YXA+nNUC/sAHEVuw/ZKtFGqancslH+IS08uMd7SltvxbfaamMiLd+8FILZhI4ZUtfgVh7Ly
	/UsStSI+wccpwl/4CP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBetO-00000004YGk-0nEg;
	Tue, 29 Sep 2026 20:57:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBetM-00000004YGU-20HQ;
	Tue, 29 Sep 2026 20:57:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0FF06022B;
	Tue, 29 Sep 2026 20:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C8F1F000FF;
	Tue, 29 Sep 2026 20:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790715455;
	bh=RdMYl/+FBs8+3dkIXmXG7fNOAukH2HxnfzLbOI0h0VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eteCmMnlmav3BV9VmIipEBehbu9MTFpWU7S6rlw/JRia+9yinMtesCNa1FJszhQBo
	 9pIx9UwUPunvTDbQ3BMZ5HNOAm+FM8LDRAbDFUr3kZGlCt4stWQ92tAHor65iXCROs
	 qF0XX+QQeO+JiSI7RDe4AKaTwyYk2c5YHhPMrqfL92pGtmZdeaUgG/1+R1Rr4+WB04
	 zWr8ude4al162lAbvao9A9DnQeghEK66UGovrYWmDYyFFmx4iSiD0rYb+3R455grRn
	 2VQ6ETuT9fth/ejrYazTM1W+EG44QopZ0ZzqJVBbDgkYSGICfwT0ULnyqDIT5Wqmjn
	 5zFG7HfbqSx5g==
Date: Tue, 29 Sep 2026 22:57:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, mfd@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/20] dt-bindings: i2c: dw: Add Synaptics sl261x i2c
Message-ID: <arwmKWR0GD3RVr75@zenone.zhora.eu>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929061417.20733-3-jszhang@kernel.org>
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

Hi Jisheng,

On Tue, Sep 29, 2026 at 02:13:59PM +0800, Jisheng Zhang wrote:
> Add the compatible for the Synaptics SL261X SoC I2C controllers, which
> are compatible with the Synopsys DesignWare I2C.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
