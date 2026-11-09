Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BECC606D83C
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Nov 2026 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vP2/1IVM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEmWI7yt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f2M/tPKK7+dUAt3cbY1BVt7+G0Pn3fmEVPOLo5/nYXM=; b=vP2/1IVMLr8Vu9exUwpoX42kdl
	YaAk5iOR68qVtUlF+j3ujCnC4fjgeO6H8UJnGja4iT6T3eZDug2O0TkPvLae9WUH8SDsulyJlCvp+
	RjRLeKAhfl4zI3W1tJS+bSzFX6rKDkX4TQ3TOofaDnYL/WhJhEQwMCXnCeKt1gOtr4k57ROU3nhqn
	30oZjSPb4A9+I4oMGEjg4iQuTRPkkZ/riLSWojSNy2HoJt9GVVzYGfANJ7QajLfC5CMlXBoI9ie0n
	iEirclJiTf+3viltrSDR9YdGICT6D64jcJa0ExYti4xLwgzNMPzm0OLTS2ZQ5tmMJIpODt/d8FznN
	ipODiiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMS6-00000000OBW-0OYq;
	Mon, 09 Nov 2026 10:18:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMS5-00000000OAd-1Ss8;
	Mon, 09 Nov 2026 10:18:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83BFD62B96;
	Mon,  9 Nov 2026 10:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E381F0089F;
	Mon,  9 Nov 2026 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219492;
	bh=tS3Xp6G1E7IqjUuDm81uq4tk6Bv4TIsCASJM2TgszDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YEmWI7yt9mV/agp7VqCcJqXsGHyA8VPAeSfca/TMwVHukr59TpQ3D0Sx6fjzgue/k
	 N6XfpwcJL8NKSsmhxSpGxFAwjSX8RaKkLaHg1bqSfAivlJ9X4SJB7O12YCv9dKAgdQ
	 tyAEknzg7yUmtVFjmNde+h4c43/BpkoHsuHEJmkhfN3OVrWp6uVjCuHbLnauKyHuz1
	 +2Cbh+JSG2cULLJaPVzuFhf4gJkKnNKblPrZJkEjM0PTodbjoeHvZTNGEJH/Xj9RT7
	 VqckqrcV1KvDrjB81F9ZbqdJSssRl8SLaa8VrIqMZxWV2eNZKmFLsfWhaYFvjszK7D
	 JTQ6fa3wa5rfA==
Date: Mon, 9 Nov 2026 11:18:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junyi Zhao <junyi.zhao@amlogic.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-hardening@vger.kernel.org, 
	xianwei.zhao@amlogic.com, Kelvin.Zhang@amlogic.com
Subject: Re: [PATCH v3 2/2] dt-bindings: i3c: silvaco,i3c-master: Add Amlogic
 A9 support
Message-ID: <20261109-bright-wrasse-of-promotion-50ddae@quoll>
References: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
 <20261106-a9_i3c-v3-2-804b69b9095b@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106-a9_i3c-v3-2-804b69b9095b@amlogic.com>
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 03:13:09PM +0800, Junyi Zhao wrote:
> Amlogic A9 SoCs integrate the Silvaco I3C master IP in two domains:
> the EE-domain instance (amlogic,a9-i3c) takes "pclk" and "fast_clk"
> like the NXP integration, while the AO-domain instance
> (amlogic,a9-ao-i3c) lives in the Always-On domain and generates its
> bus clock from a divider inside the controller's own register space,
> so there is no external fast clock and only "pclk" is exposed.
> 
> The two instances differ from the vanilla Silvaco/NXP integrations in
> clock topology and required init, so the driver matches them by
> dedicated compatibles instead of the "silvaco,i3c-master-v1"
> fallback: a fallback would bind the generic driver data, which
> neither programs the fast clock rate nor handles the AO internal
> divider, and the variant would then fail to work.
> 
> Add both compatibles to the schema without the fallback, following
> nuvoton,npcm845-i3c, and use per-compatible if/then conditionals to
> enforce the clock counts: two clocks for the EE-domain instance and
> one clock for the AO-domain instance.
> 
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml           | 26 ++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
