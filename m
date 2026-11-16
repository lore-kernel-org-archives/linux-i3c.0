Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60077606A335
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Nov 2026 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wCGll3Ig;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8Lxn8QD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=T4ObIQuEYb2KanUymozTflmE1wC3+s0yVQ4Br6PKhO4=; b=wCGll3IgtPG1COwJC7f1KCrtyG
	VBlU+GU5NpnYAGPOBQoEgSbd9JMpkvxRzBr+xscP7nbkLgTVp9dVPRy+XozbSgThftQEOpLAIXvb3
	Y0bkTaxPeQVs61WHxvGa875QzFJ7HHiO9D69o22oz9PHs3mpWBjQe2KYsNmA95FhS71Bb4MT20Ogw
	8guzz935ZB1/kFcXNDA5lr8gkXH55Vqahc5PywCAikmWlOoFSfknDEp4H7JCPO1rF7r9weDx+r0/f
	L6YjB+byvJr8P7LMH4yAN2JH+IrbptNgKA1i1HAxr4jnzkvVXrHuMKootThn5lVi0Lbsnt52Hwd0Y
	sgQsgVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuHM-000000020vC-0VRN;
	Mon, 16 Nov 2026 10:49:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuHK-000000020u2-0RsS;
	Mon, 16 Nov 2026 10:49:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CCEA42E26;
	Mon, 16 Nov 2026 10:49:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794826177;
	b=J6MCTqGwWq7/0fbVfny6G+ItdMqjZXSpPyX0yXrjikmg9XtanIR7l7uZpDSqHVFFIhjd
	 Yfw+8J6loEeetf3qaj8J0rz3EEUEyVHT/AshFsly8l8mvFd16qIkq7kZ4PWoTw4KS5OSm
	 WSpUJOMPeumCThkds+XJnKIOGC5pmqh34qkOlin7laJKXKV/aRtUqC6t2Ap9PCr/7vIqu
	 GcGGuChL0Mx/z4mPF7eCLXM196mENk/ePt1O5xdkinMezgQeGIyA+3n8S/ctxdUDYilS3
	 /1ZxtCdxkk/eaWcmvoOqnJJzgPSBjhRJH4Eh8gUeL3sswDmRhZZu1ht79chM6o4+UOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794826177;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=9mEt1ki6LJVDYJ303Gf1hVtG0akuG6QKkchh3nXSXkQ=;
	b=l02vd+FZQlrdA+2sPe9rRJSeXnFXQxbMBieAzjfLcWhx+WMhUgWuUyN2+GOYmUlL4OUm
	 hTxXm5eF8VNLBnDD2nnOk6j+5uUdyMT4CnDFGW/iAeHBpPZhtYqbZTsa2TX1RPLCuZN84
	 k8MOp96En6JrfNQxBBLVkhNMGElyL90Dh4pQtpQid6ItRb3wpccWlVF85j2X1J18N1WwN
	 Ovysqo5KMXGp9qID9sqqsyCerkA1L/aq9kICZmPSG/vaWdG7hlleV9gxV/SfAu91Pqb6p
	 D9RDf/xWQkVWZAcRh2LnST8rXSq66+yAqmRThr1H4ksmc0YF+MuS9Z9dNImv0VG3YdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 154551F000C5;
	Mon, 16 Nov 2026 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826177;
	bh=9mEt1ki6LJVDYJ303Gf1hVtG0akuG6QKkchh3nXSXkQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=l8Lxn8QDQO/lqPQstct8KiGbhqyEhfhaVTi2Sck5ph+ZZQY9HfEXty9oVs21OOg2h
	 O36jG77HiAQkdDFasCACjcH693qSkdyxkgxck7ZVPAxvA5GPbO5Po/iuCzQQRHZ0Yd
	 zt+mbmuGnCGoCtkqSQVD0RXw7w2WlhDhIBvdIFb1dJ/gcQvEX9EWyrIapi+0zZSefW
	 Vqv77z02uyhUdNxMb0Pi7KLD7tHQfplCwAtoByIygI1cZiFalkZnp2wcoupQvwBFkb
	 50jjwaPJG1G34m65/QHY69tv10GM2Z3hzDYAEpJIGgCZAANvaDmF+u+FCM/rz1yS90
	 xizBe7IDqzlPQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 684B04A429;
	Mon, 16 Nov 2026 10:49:35 +0000 (UTC)
From: Junyi Zhao via B4 Relay <devnull+junyi.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/2] Add Amlogic A9 I3C support
Date: Mon, 16 Nov 2026 18:49:28 +0800
Message-Id: <20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALjf+moC/2XNQQ6CMBQE0KuQrq35LQX5rryHMYb+tlCjYqgSj
 eHuFgyocTnJvJknC7b1NrB18mSt7XzwzTkGtUgY1eW5stybmJkEmQsQwEvc+5Q4mkyqzAAqKlg
 sX1rr/H0c2u7eOdz0wdJ10EOj9uHatI/xqRNDbxrFabQTHHgq0RQCTS6F25SnY1N5WlJzYsNsJ
 z9QgJyhjBBIrZR2RM6V/zD9hvkM0wgLUDpHjYCZ/oV9378A3j0XxSIBAAA=
X-Change-ID: 20261010-a9_i3c-9d5245d094c8
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com, 
 Kelvin.Zhang@amlogic.com, Junyi Zhao <junyi.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794826174; l=2920;
 i=junyi.zhao@amlogic.com; s=20260924; h=from:subject:message-id;
 bh=tEwHdY6mdhTInElfOAdG6vOt9+cf0Vk0A3dk5bHZYZI=;
 b=pc0or0fzYVQZI40xYj5aVT8xvcrZ6X6fqq6ehw9PkNRbWdB9Ln5BaE0MLtADdfzTQBfvy1E4s
 OF46/MSZkB7D8DuOJSqWIrGKGOGPSZn7bhdA0IIs1jLdN5iuzBdZGqM
X-Developer-Key: i=junyi.zhao@amlogic.com; a=ed25519;
 pk=hiL5PjGIksGFiWvEx9J3MhQqU/ro6vNbj72NIw4bbvA=
X-Endpoint-Received: by B4 Relay for junyi.zhao@amlogic.com/20260924 with
 auth_id=1054
X-Original-From: Junyi Zhao <junyi.zhao@amlogic.com>
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: junyi.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Amlogic A9 SoCs integrate the Silvaco I3C IP, but their peripheral
clock setup differs from the original implementation: the EE-domain
controller (amlogic,a9-i3c) takes two clocks, "pclk" and "fast_clk",
while the AO-domain controller (amlogic,a9-ao-i3c) exposes only
"pclk" and derives its bus clock from an internal divider inside the
controller's own register region.

This series consists of:

  - Add the Amlogic compatibles and per-variant clock
    constraints to the silvaco,i3c-master binding schema.

  - Add a vendor_init callback for the clock setup and an
    Amlogic-specific bit (AML_I3C_QUIRK_AO) for AO-specific behaviour
    to the Silvaco I3C master driver, and enable the existing
    Silvaco workaround quirks for both Amlogic variants.

Verified on Amlogic A9 (BY401) with both EE and AO controller
instances. dt_binding_check and dtbs_check pass with this series.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
---
Changes in v4:
  - Move the DT binding patch before the driver patch.
  - Add CLK_OPS_PARENT_ENABLE flag for ao tail clocks.
  - Enable fclk before allocating the new clk bulk array.

- Link to v3: https://patch.msgid.link/20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com

Changes in v3:
  - Merge vendor quirks into the legacy quirks bitmask and add
    AML_I3C_QUIRK_AO for the AO variant.
  - Check the devm_kcalloc() return value when allocating the new
    clk bulk array.
  - Enable the clocks before aml_ao_i3c_tail_clocks(), because the
    divider registers are accessed during registration.
  - Rework the probe error paths so the clocks are disabled when
    vendor_init or later steps fail.
  - Reorder the local variables (longest first).
  - Convert comments to kernel-doc format.
  - Depend on COMMON_CLK in Kconfig.
  - Drop the silvaco,i3c-master-v1 fallback and add a blank line
    before the new if/then block in the binding.
  - Explain the I3C peripheral integration details in the binding
    commit message.

- Link to v2: https://patch.msgid.link/20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com

Changes in v2:

  - No need rework the Silvaco I3C driver. 
  - Based on vanilla driver, adapt A9 SoCs through callback 
    and quirks to handle the variant.

- Link to v1: https://patch.msgid.link/20261019-a9_i3c-v1-0-329d819d621f@amlogic.com

---
Junyi Zhao (2):
      dt-bindings: i3c: silvaco,i3c-master: Add Amlogic A9 support
      i3c: master: svc: Add amlogic a9 support

 .../bindings/i3c/silvaco,i3c-master.yaml           |  26 +-
 drivers/i3c/master/Kconfig                         |   1 +
 drivers/i3c/master/svc-i3c-master.c                | 276 ++++++++++++++++++++-
 3 files changed, 289 insertions(+), 14 deletions(-)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261010-a9_i3c-9d5245d094c8

Best regards,
--  
Junyi Zhao <junyi.zhao@amlogic.com>



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
