Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4477C606A33D
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Nov 2026 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NXvVl09c;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOez1qSc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=A1FTUQ5/zUI6R2C0E+OZY9Zb3VONzu68hgDXktCMDqc=; b=NXvVl09cIJjaYDoghaJbJD9HLM
	UwkGnZ9jO+IqFMI2HePneJuUTuYb2OgslRRmRXXs36PxCgIsXyHLYK7dIy6rCholqKgfXbEeiQF0E
	n0eWyXvD1f/u5t2/R/Wbrq2AI4qIKf7OQwlocn2tQtZHOTkGDxzrcZ6ZEHTz/LyNeW7SI01eHAjLA
	f89pgQqvOmHphzVCPDitC2BrxC6dNhrtRU6w/7U/1zVCwDLk2AZ53veeL4JjglIfjQH5INSjaqATb
	3QyhbtnSGvPifVK2C90nm14iRl2800LV6fdd2aAGYL489Nh8jpLFy2brxtYLKlX9we951Rh+X9mvk
	ERFGvS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtfj-0000000AoiN-3grT;
	Thu, 19 Nov 2026 04:22:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtfg-0000000AofA-2krM;
	Thu, 19 Nov 2026 04:22:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F4F464A45;
	Thu, 19 Nov 2026 04:22:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795062171;
	b=ZohhETKuv2c9AGcgHgwOXYIFyucFqArrmvFrje7EcnqLnze0BoAIBhHlA4x4YBkLNaRn
	 QUf7tZ5VZe/mPTLTwt7S2t7RN6KlByNyrduID5Dsbf5IOpusk0IRzWT1iE3SpwRwMiRtd
	 xgdPoqWI/Pm9NB59WP0nu4jH8k2XHr3AoxpTZe+V5E/eD6fG4GIvha2kxRrkHhEZdTUIu
	 f/fJYwwcJHJnQSWGLHNQAj6OkCwH1mgZAQjdjjQZ1yRo64LOVMHspwi+/hSdSJbi9yWUS
	 mTZ58qWbYpo4I7Vip/4W0DqFlfJS9RKz1hC8QY5lt6VGBrEfbWgCvchLtUQG37PctuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795062171;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Yv6d6bSBIIv/IerploKHMuR5GZabm5s7nfjxnfDm4VQ=;
	b=NjNuaRYtLgxMKO8A2fTpk7aoQ/eEeuPttPKveVfx8M4+ezMZpaJh+OtOYp9g8V/dnbmz
	 4Qx/ezcQh8p0bQjNAFuZ05JlORPZt8bo2bPu7jIN+yTF7A98UxgyJNDeb50DiTlZT5mow
	 9GIEl4SRwhWEuni1b1yns61YnrSQGKaIEc7zZkcneOZRXUxbnWn9OOgopSHXvWm63kyjS
	 Qk6L8hJS6Q2WUZk+M6hqekN62L8ryZwdjJrOQzM0NNG7kHPCjPXV7M4wEJg7ChQ7T6P+i
	 jAZ0gF/VRUu16Y52qqPw6lEGGl+QHNIF+MuSePjFQ+miW8jJIKBWF/C+hYS+YdBVa2g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A726E1F000C7;
	Thu, 19 Nov 2026 04:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795062171;
	bh=Yv6d6bSBIIv/IerploKHMuR5GZabm5s7nfjxnfDm4VQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=DOez1qScdIAhF+wpQyPSTiXaHmcKfua41dF1J/JMKgsxd3Ur0LYt5lCoMx+Pv/R+9
	 CWoJ+DZ6Vk0XfHAqNsqwWwQjoCA/5h4XzUC309EAUmQBZ8pbeBFDtQP9q4yV7MSq06
	 6FbOlTVs9pbnF1hybIGJPnG8cyCJntXJoYSajssyzC8GWgWuDDxU8tnOMvt2LJVKhH
	 g3PAu1BAnAEayE9ZVOETnVrPKCKRISRqbk9pBO47z0/OrnVQwf/MneiuIR5NG6vlX6
	 wg8X59fKFjmkpRmruVyP4yBoqNw2SY3sfawea760vhFiRo3M44LGZ+8sqKBaFJJSMw
	 g7Q1z7OMGYh1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0660E4B0D5;
	Thu, 19 Nov 2026 04:22:49 +0000 (UTC)
From: Junyi Zhao via B4 Relay <devnull+junyi.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/2] Add Amlogic A9 I3C support
Date: Thu, 19 Nov 2026 12:22:45 +0800
Message-Id: <20261119-a9_i3c-v5-0-6ec51f8fb59d@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJV5/moC/2XO3W7CMAwF4FdBuV6Q7aSl3tXeY5qmxkkg06BTw
 6oh1HcnAfEzcXmk8x37qHIYU8jqdXFUY5hSTsOuhOZloWTT79ZBJ1+yIqAWAUH3/JmMaPYN2cY
 DW+lUKf+MIaa/89D7xyXnX/cVZF91bWxS3g/j4Xxpwtq7jvJ1dEIN2hD7Dtm3hPGt334P6yRLG
 baqzk50hwh0g1QgiF1ZF0Vi7J+heYTtDZoCO7CuZcfAjXuG9gHiHdr6qjdE5FZInf8P53k+AaC
 VN5lbAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795062168; l=3278;
 i=junyi.zhao@amlogic.com; s=20260924; h=from:subject:message-id;
 bh=xV4H0o4G83ywiHtiXYg2J/lDkmvf0Uuq0lK84mEN59U=;
 b=ASWcwZgj9n6dw2BnDntV1w4pXAefYU4kmHwXGxCQ7A2VkjXfTmf9bLqUvXPIrIjyFVzs5XuNO
 CEjjd0iNLcGAfKkz/H7NHz4FBgFQ0OMAqIX5vwTdcrAgHhF7tOaQzY4
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
Changes in v5:
- Check the clock count and name before dereferencing clks[0] in
  aml_i3c_init(); a DT node without clocks or clock-names would
  previously NULL-deref.
- Factor out the fast_clk lookup into a shared NULL-safe helper
  svc_i3c_master_find_clk().

- Link to v4: https://patch.msgid.link/20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com

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
 drivers/i3c/master/svc-i3c-master.c                | 301 ++++++++++++++++++++-
 3 files changed, 311 insertions(+), 17 deletions(-)
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
