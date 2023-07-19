Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8915EB64DA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Jul 2023 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbShLzTxaAxT4jS5/inPSIEiwwx8zayqY3Hsb3xnuTg=; b=terTX3ZG/o1mnx
	amQVUnGzbpADvp+B5vth/ZwcEDU5giSSqGbehfHJrLM/Tzy47aQSyH7CI22WRCRBfYykFzScABJRS
	GpSVUg0Ns257L/1xK4/JmUTyq4PVA3ZkDqu8lt7FbKHwDsOyFmikRGGI7ItveoB+BXhtPi4auuCSz
	1woNZDlB9lxjm9QPVFVxIgEIJP+rhX+8BubDAhT46CUefTp6wuSLo49cuR+tRUCEdwW36ZxWD17G4
	gMcVdDic0Ro9b8jOo/UbTHyfwgxtefa+oR/B4WUxz9bch6kBXayseTQINewKyicuMX0MrcVHdHesR
	44osRMiscCVnNuUvgKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3CN-006Vd2-0H;
	Wed, 19 Jul 2023 09:10:19 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3CJ-006VcK-2J
	for linux-i3c@lists.infradead.org;
	Wed, 19 Jul 2023 09:10:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E6A2E000A;
	Wed, 19 Jul 2023 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689757811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FJQzHgUn5jtZR7Bvu9wqnoFa2PUx0KKZisBZ3qh5ts=;
	b=CEqBSdpXtoJJIly0zhY3fqAJqW661RVnOreX1YIbR4gVdP3CJAb173FWIwJwzbRQiDs2qt
	JNVQAHDW2a6e3zc28720LFvZ/s7zxqCgBsgisodSemofjr8xMUk3fjvKdbsOaq8OPFvfU+
	gQh96Q+mlHUbyA+BLSiVOx2p9wuAX6ppJIArAky7hnpHhuy9Jipj2DHYqs9ioedS6aSnGF
	Ghoo2ngUykvFdwxxHRQZ4knqIS+jtoCv5szyLB21vOhpwIOBxCKVRILxy90RnHcEOrJ++d
	Ea5+Opu2YzgnjOgGQYTF3oRafHBFa/MQWlu3UBjp965JJ6+IzdC2XC7A3Hh9/Q==
Date: Wed, 19 Jul 2023 11:10:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: i3c: Add mctp-controller
 property
Message-ID: <20230719091009dd6fd57b@mail.local>
References: <20230717040638.1292536-1-matt@codeconstruct.com.au>
 <20230717040638.1292536-2-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717040638.1292536-2-matt@codeconstruct.com.au>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_021016_605790_AC60AB85 
X-CRM114-Status: GOOD (  15.92  )
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

On 17/07/2023 12:06:36+0800, Matt Johnston wrote:
> This property is used to describe a I3C bus with attached MCTP I3C
> target devices.
> 
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


> ---
> 
> v2:
> 
> - Reworded DT property description to match I2C
> 
>  Documentation/devicetree/bindings/i3c/i3c.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> index fdb4212149e7..b052a20d591f 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -55,6 +55,12 @@ properties:
>  
>        May not be supported by all controllers.
>  
> +  mctp-controller:
> +    type: boolean
> +    description: |
> +      Indicates that the system is accessible via this bus as an endpoint for
> +      MCTP over I3C transport.
> +
>  required:
>    - "#address-cells"
>    - "#size-cells"
> -- 
> 2.37.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
