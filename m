Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A760C83F27
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 22:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZ9qKOnwGx8tHpYqUlUOk62BhHYMHGeJJNgVkFtgxgU=; b=wkFi7KFLS9vc+G
	CerdQKbqQtOVHRh1EUiYR51+zoVmgFYlQAxDdI346X4U6tpCP79iL0QxC4bhxGKxAoU62Q57HUmLB
	Ep5S3+6dVIuWrU2kCjGytS53aFeXMfY7q/1FYXskhj7urvjt8y+cepooNOSyEWw2aRuFwduxxX4s7
	YTpGEV6iUuHOqGunTCMeqtHg4YyUvx55walc2cKz/JUzj1R4TglRIMRTmWFYtWoDTG55nWRoJBxEy
	lpR4+YbNGqZETFZFg5fiGj88B3Ay6nWBHdGkQJg0+6H20C7hqulhf3+UNdHPWbg+ZSrbpNgmsGtGL
	GF+8Z4uQ2Xg+v5b+gYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueLjG-00000003cJB-3z69;
	Tue, 22 Jul 2025 22:44:58 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueLgj-00000003c7R-2Klx;
	Tue, 22 Jul 2025 22:42:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69C9943275;
	Tue, 22 Jul 2025 22:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753224136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5Yg+pdTXpo6t0O7UQl+RIbiB4LOKOnIdXdXoBOJyck=;
	b=OiwP4pKbiIk4mcSLaL9RdN2P/6K+rHryH62SPWAsZd52iz5Z/rFoylJzCtRSvzA2tb7on4
	Cc+C1huFf+QizyFqpxlSeHww+c27B+NZbxavUsmSYrsFLRmzmwATEOBRdHu/X4+i8rNedF
	2Rt+a/ijrDx8kZhxNeKML482g2M6o/w7sLBzT7INqvxOROp87kjKZhylh0BO0pXsSKSaAm
	8TCPBtxwgM1FWhZWQj5TMO6jTubmAUh0Ad+QSa1VcFrFdJ291BxVmw0E+cYdPHvpUTuVT3
	uHDpKLgC1+i+WXdaDsm52o61H8G7VrwA+8WYRlDT/vS+J283lNr85hBFHGxudw==
Date: Wed, 23 Jul 2025 00:42:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Harshit Shah <hshah@axiado.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, soc@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 06/10] dt-bindings: i3c: cdns: add Axiado AX3000 I3C
 controller
Message-ID: <20250722224214cd72ae8b@mail.local>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
 <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-6-543979a60ccf@axiado.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-6-543979a60ccf@axiado.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejiedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehhshhhrghhsegrgihirgguohdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehjihhrihhsl
 hgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehpghgrjhestggruggvnhgtvgdrtghomhdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopegssghrvgiiihhllhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_154222_249755_84CE4F05 
X-CRM114-Status: GOOD (  14.59  )
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

On 22/07/2025 13:15:34-0700, Harshit Shah wrote:
> Add binding for AX3000 I3C controller. So far, no changes known,
> so it can fallback to default compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Harshit Shah <hshah@axiado.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>



> ---
>  Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> index cad6d53d0e2e35ddaaad35215ec93dd182f28319..6fa3078074d0298d9786a26d7f1f2dd2c15329a7 100644
> --- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> @@ -14,7 +14,12 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: cdns,i3c-master
> +    oneOf:
> +      - const: cdns,i3c-master
> +      - items:
> +          - enum:
> +              - axiado,ax3000-i3c
> +          - const: cdns,i3c-master
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
