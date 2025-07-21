Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656DDC87FC5
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Jul 2025 07:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFhTZScK1wyGWGG6VBJXITG7f8Lwuf1WVo824yzFEUU=; b=qaUtjV+5vl8d+z
	o7VNlx48waoPcGmo0XA3ljw5jqSPsY4usjayHZDfDToyXtWSoQGo1NcbBVs6PBVxhKtxCx1QtncLj
	f3YbLG9aTriVhJIUn9+rq1hp1/0EpMa3WpuNHTPa3Ut3MQPXFfWzZ9adpoPH8goWw7m0LM8AXqqQp
	FGD7uQpleCbvkmWWh4+ROdTTpCD2HzWxb0pa7/OhLlxOcjRdtuiaZfcVOL1wLLfjWsHpeRnEICzru
	fz/mt8rXIBCm4XYqBsgMUTcYXx4lZVHbTJOF/sphottsNvlCYLkLNKIuBSG59a1swMZTQ0IxNWO+P
	EPMKUeZuWcxEe265yxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udl9U-0000000GWFv-0fp7;
	Mon, 21 Jul 2025 07:41:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udl5j-0000000GVce-1Uvz
	for linux-i3c@lists.infradead.org;
	Mon, 21 Jul 2025 07:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD1305C57F7;
	Mon, 21 Jul 2025 07:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61DDC4CEED;
	Mon, 21 Jul 2025 07:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753083462;
	bh=gX1shcXkNq8kGP80WbZWZhNw8XOGe5hjaiGjaxBIe8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GzhaY/YI+eCsiSfFYzJm8buehbzWYHGIXYnYXgb4lf1dQrFqS+h45vTifmAUkYPGw
	 aYxn8U9Y/NBXFxevEhnjarI0hetPPfpgp5aQ7qiN3/sOFtoJLLtudv49hxJojd2Z43
	 fK0NQxk9/oJnfuA11stiV6dez/R3ngVp3MZOQ176Dr5gz/uJE7qfFASffvAlfDVkJU
	 F12lNJ5pEW8sVytZBNEwIMk8IPJaBna02sRuvF41IN0Xl9V8iiGY0BhIpQ6PSofg/s
	 EIHw5kXmqkeSq39gBFqj2KtYoO2s6drkLTC9tO4a4AqgMkZTFO3DRJdYbFOyul1ItO
	 k+ikcX/R0SoSA==
Date: Mon, 21 Jul 2025 09:37:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gastmaier@gmail.com
Subject: Re: [PATCH v6 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250721-large-daffy-vole-d2d25d@kuoka>
References: <20250717-adi-i3c-master-v6-0-6c687ed71bed@analog.com>
 <20250717-adi-i3c-master-v6-1-6c687ed71bed@analog.com>
 <20250720232726.GA3055763-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250720232726.GA3055763-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_003743_437825_84223689 
X-CRM114-Status: GOOD (  17.10  )
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

On Sun, Jul 20, 2025 at 06:27:26PM -0500, Rob Herring wrote:
> > +description: |
> > +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
> > +  implementing a subset of the I3C-basic specification. The IP core is tested
> > +  on arm, microblaze, and arm64 architectures.
> > +
> > +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
> > +
> > +maintainers:
> > +  - Jorge Marques <jorge.marques@analog.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,i3c-master-v1
> 
> If you want to use version numbers, they need to correlate to something 
> and you need to document what that is. I don't see anything in the above 
> link about a version 1. Kind of feels like you just made it up.

I asked already at v4 to document the naming/versioning, which was a
result of one of previous discussions, in the binding description. :/

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    items:
> > +      - description: The AXI interconnect clock, drives the register map.
> > +      - description: The I3C controller clock. AXI clock drives all logic if not provided.
> 
> Is that a description of how the h/w works? The controller clock input 
> can literally be left disconnected? If 1 clock source drives both 
> inputs, then the binding should reflect that.

This was explained in reply, but never made as proper explanation to the binding.

Jorge,
When you answer to a review about uncertain pieces like that, usually
outcome of the discussion must end up also in new patch - either in
commit msg or better in the binding itself. I also asked about this -
documenting the outcode - in v4.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
