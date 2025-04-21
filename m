Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBC0C369AB
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Apr 2025 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUH+EN3jIzj1CyH9rq+jA3npYU9PybO+7Wi/hGTFWIM=; b=XBtwrChEZP3THU
	wrj60GS04PHSwKR0A4KKBvt4BGDzbHjMsUKWI+PsLW/Dy4ts58Kv++BHsCicQYGDH1S+j1B1+0qaF
	tcWlvC1Bv6Hye2nIjLVpKp+rmq6Ps64JVV9j6jDL43BtM2KI63lwmq6gTRRl3QdSGB90LkDfiU7+d
	FJ5kGToL0hqAGY84591uXmznoh45LFuak+9AVRLhvvp/5HyiimhRgQ8kJVBLdvG/6XT0YMDnHKZrE
	EtzkhVzM6uwRtRzBuKGq5JmZOMoY+w+bLz321v1/CXVtAlUVUD8dJr6pT8s11fG/KM11OIUOHHvwD
	cMLlmec0gbdI3bSUY+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lW6-00000003mV7-2Rt3;
	Mon, 21 Apr 2025 07:24:34 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lUD-00000003m3y-0Qkx;
	Mon, 21 Apr 2025 07:22:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70FD71FCE7;
	Mon, 21 Apr 2025 07:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745220153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pB/HrPehJ8yBSz1jcdQAHt5d+DzA9WDigakwtL+7yQM=;
	b=BPTWG4046AxS47RS7og1B9IhPUceoJjjieNTQ9pyyODZGK3f1/gv+okj+dogYvAFzkwdvl
	+M0W6IlJ1Dz/MbxF7uQF+f43IeqgrNNeKjue/wpfk5125IZI/1s11mwxasTW8qe+NX2vY9
	FoOuJz90Va8h3peogzG1AhpedOoqJDu4QUJAGvWNwbYgdHvwqNQ4+VtpGQFPS0TLZg5Ic1
	K0Jz9s25srNQ191xM+9UWbq4qgXFEKH1L/tSVng31v67fGi5jz4w/Zn7FH81E05MRNeN5C
	bqE0As9y5KhVnbufyPqpK7LH8kAl/9hIrW7+KJz0nxnJwF8MmbpQMADBIyuGgQ==
Date: Mon, 21 Apr 2025 09:22:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and
 i.MX95 I3C
Message-ID: <202504210722320ac51194@mail.local>
References: <20250421061544.2471379-1-carlos.song@nxp.com>
 <20250421061544.2471379-2-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250421061544.2471379-2-carlos.song@nxp.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemtgelugdumegtvdhfkeemhegvsggsmeeileekudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmegtleguudemtgdvfhekmeehvggssgemieelkedupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegtrghrlhhoshdrshhonhhgsehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtt
 hhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_002237_882142_93155CA0 
X-CRM114-Status: GOOD (  18.07  )
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

On 21/04/2025 14:15:42+0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
> chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".
> 
> Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
> three clocks. So add restrictions for clock and clock-names properties
> for different Socs.
> 

My guess is that the IP still requires 3 clocks but the integration in
the SoC feeds the same clock to two of them. I'm not sure this change is
required.

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 4fbdcdac0aee..9255d35e2854 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -9,14 +9,17 @@ title: Silvaco I3C master
>  maintainers:
>    - Conor Culhane <conor.culhane@silvaco.com>
>  
> -allOf:
> -  - $ref: i3c.yaml#
> -
>  properties:
>    compatible:
> -    enum:
> -      - nuvoton,npcm845-i3c
> -      - silvaco,i3c-master-v1
> +    oneOf:
> +      - enum:
> +        - nuvoton,npcm845-i3c
> +        - silvaco,i3c-master-v1
> +      - items:
> +        - enum:
> +            - nxp,imx94-i3c
> +            - nxp,imx95-i3c
> +        - const: silvaco,i3c-master-v1
>  
>    reg:
>      maxItems: 1
> @@ -25,12 +28,14 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: system clock
>        - description: bus clock
>        - description: other (slower) events clock
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: pclk
>        - const: fast_clk
> @@ -46,6 +51,34 @@ required:
>    - clock-names
>    - clocks
>  
> +allOf:
> +  - $ref: i3c.yaml#
> +  # Legacy Socs need three clocks
> +  - if:
> +      properties:
> +        compatible:
> +          const: silvaco,i3c-master-v1
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +  # imx94 and imx95 Soc need two clocks
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nxp,imx94-i3c
> +              - nxp,imx95-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
