Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2CDC369AB
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Apr 2025 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQhoSM5GQvBmGdI6ZMtBaADwFw2Nz/vcFWJTG0xV1aY=; b=4ss6ovJnXHIbdE
	ASZ6EJbvZGsppTVPVNe1XAfaIfZgPB6Vk5qqUaECWS3VtIINLcE5ClTwkhwvVUa/KQfj0JY+zMkN2
	pj7/+drROn6o0u1PO6yS7aKESt3bwsn0H0vHjcxxHPFmV2QZZvHQO8gBs8923TLwIcqnXv8WYFWk7
	iAPLe2GfHt7aYJD6s5nrl6ZSLuQP/g9Kc4k0Xyt7B85U4kW24X4yxEuUZVz4SATyosw9iwhY2LOaU
	OwyvrWU8Eg2kmth8C/BkePTrEW8t+OXBb/1AYlYcAAtHHaNpLim84aQSBIeACa1mQkYeNUlx3y1k+
	dmiQBAb2UmppaLk2pqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rK6-0000000DF6K-0bj6;
	Thu, 24 Apr 2025 07:48:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rI3-0000000DEld-0col;
	Thu, 24 Apr 2025 07:46:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A68C68457;
	Thu, 24 Apr 2025 07:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1BCC4CEE3;
	Thu, 24 Apr 2025 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480794;
	bh=0V9WGCW9Dl7FGs6F9jrkHbnIrmofvrWwmHG1/UcXuG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/pJzigr5qdS5xSGAQGWHUe4MJTilt/YKSPtuZ0NNdAMf5FKsGNtS0gLki+UPlU8X
	 KlYrqz+ry2ovDqhKoytL6go9LtGj17NRNGrdGsmZ0k/07J2cFIBqWrEypyaojUG9UY
	 akdHqVvoKWagDioiWQ5DBtqHEKkBsJ8SM/fJxNElPiGiPaxwV+F0IJFxAh9XfdvmMj
	 GXZ++6Kpoixr9elcveD6jIr9NmQUh7crXZf/WD1npP0zd9wJDVzNbnpedBPP7hqxFb
	 quT2bZUxP8C2RhXFtZ+nwbJGLVY2OsiU7ec3E71UmJh9bBUWzKScgGg+LvpHmMeHm3
	 rZ/0YL3Cw0d1w==
Date: Thu, 24 Apr 2025 09:46:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com, 
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, conor.culhane@silvaco.com, linux-i3c@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94
 and i.MX95 I3C
Message-ID: <20250424-axiomatic-fennec-of-kindness-ce1acb@kuoka>
References: <20250422070853.2758573-1-carlos.song@nxp.com>
 <20250422070853.2758573-2-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422070853.2758573-2-carlos.song@nxp.com>
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

On Tue, Apr 22, 2025 at 03:08:51PM GMT, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
> chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".
> 
> Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
> three clocks. So add restrictions for clock and clock-names properties
> for different Socs.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change for V3:
> - No change
> Change for V2:
> - Fix bot found errors running 'make dt_binding_check'
> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 4fbdcdac0aee..fd64741abc0c 100644
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
> +          - nuvoton,npcm845-i3c
> +          - silvaco,i3c-master-v1
> +      - items:
> +          - enum:
> +              - nxp,imx94-i3c
> +              - nxp,imx95-i3c
> +          - const: silvaco,i3c-master-v1
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

Drop comment. I do not get what is here a legacy SoC. Which ones are
legacy and *why*?

> +  - if:
> +      properties:
> +        compatible:
> +          const: silvaco,i3c-master-v1

Missing nuvoton compatible. This is supposed to be enum.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +  # imx94 and imx95 Soc need two clocks

Drop comment. Don't repeat constraints in free form text.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
