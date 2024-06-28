Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3894AC3064D
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=g1j70OQVVGxQo2DcvBtJFxnlYC2WhyD9OC8SW7gt42o=; b=083pIpcOQYRi23FQyUDSsQoSnx
	8PJDc2j+MMJFI9938WHJeVwc1AtNZnPLG6qzIcZl/KUgVt9e0jFmrkUyC0nkLa9e+VVQXczn5kd/Q
	osHBiOuLCwuiZd5U3H918OK5NY3F06/iyBlidO0+SOfO9kp13QNgkaYeT5VV0yhe547I8TB8Ow3rz
	zLBfHkUTEjkNvBXA0zEeM+KkMmI28iXCqLUa8ZRF4avWEoja52Cie9xytQ/WelVVOUiMjo2kUfhRp
	3gomjcivklwEwkO6t5MRfRL9zq0LlA73Zv9R8aWxvzZgvaDYB31aqpKIRklM+bBVIGuG1lRk4Ii6J
	8fl1R9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDgN-0000000EEak-3FCi;
	Fri, 28 Jun 2024 15:38:39 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDgL-0000000EEa6-1k0t
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 15:38:38 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02bb41247dso1212932276.1
        for <linux-i3c@lists.infradead.org>; Fri, 28 Jun 2024 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719589115; x=1720193915; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9E6CDkEl8WVKZKqnxjSvSO7qQyb+0+zva6cbAiVPuvs=;
        b=VVVeBiZkgPUFMUqu+JJ5Jm8k4dqF0pbKRrhnfaLmdti+XNPkR8m6FqKyJGpaqDzH7D
         XSLFX7Q15sOFIn5kUFzjVXdIvIsvLseR6a+O4XosgeJ799v7pflDP425n52PnjlEBft5
         8Z6rZGb8QJRtYkHx3rxfsprUMo7B3YcaCWaFkfhGC2j/EJs8gw3W8giQopBrmg1C7LQa
         24+ZTY2jv0P6Y5klQc1GMw/uitZTWUANVSpPBDK+t/VPW377NFxNLWwddcgSfMbXegiz
         gdjfmXTG8ROuyy0CizeiCpd6Dt5l64449XcJzxmI5bPNjf7iQNEdhCuPNOltMYNWl23H
         ELmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719589115; x=1720193915;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9E6CDkEl8WVKZKqnxjSvSO7qQyb+0+zva6cbAiVPuvs=;
        b=IqzOqwZa+vjH37aDxv5hjzs9RnhdaeBn6T3qu6VYycq1TFsOPuiO+WY9kcc/5kivTU
         46w2oC7/+vEN+RtJQHHwJV10HBbvsTVd9BwzUdWXuG0f8JBe+uKWNhiPvUK/6We+DylV
         GJy/9RgQ1fPuNucT9i2EOs1fvBv92s1YkMD1Rean6E5hRr+LwbpBfuJWm0DovxMtfOuy
         lBH4IeESDlEPGa2Wo/naeWcsoXm8Ooo7IJhCfrB6rzTH24MVT+PNrujXDaKZg/czCVaU
         Tx0wVVeFDriRCQGo7QLlRlB9vJpWmtfq2lWm6+RTR4tQT17YOH+vVPaiAXZmqJ1Y8znT
         oOvg==
X-Gm-Message-State: AOJu0YyiaeAeJvurBda41tQQG8mKck/wxLVd0mrftOjXGrAZ0vRXrn3R
	UKi52C8cikMxWsKJ/6WXd8dx4jtjsi9OoDYyRArGJvYeXmm4yaTrnRumFx2FJOdCt8mBxOkcdGs
	sxRO1aiIVgTCloqPdWEd3bz0UOA==
X-Google-Smtp-Source: AGHT+IFbAOblu3KJevq7sqlPwSTEqrm84WW13aJYNyxIrhWTYRRVG7+VxoRMM+Ura64VKD/rC6vfzOSr6fhwJ1JiTyY=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:20c1:b0:de5:3003:4b64 with
 SMTP id 3f1490d57ef6-e0300ee84cbmr86403276.1.1719589115375; Fri, 28 Jun 2024
 08:38:35 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:38:26 +0000
In-Reply-To: <20240624052851.1030799-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240624052851.1030799-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240628153829.303719-1-aniketmaurya@google.com>
Subject: [PATCH v3 0/3] i3c: dw: Add apb clk
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_083837_473110_D77E987D 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

These patches add APB clk aka pclk to the dw i3c driver
and the binding doc. Also move to _enabled clk_get APIs.

Changes from v2 to v3
  - moved to _enabled API first and then added apb clk.

Changes from v1 to v2
 - extra example removed from yaml file, minor renaming.
 - 3rd patch added to migrate to *_enabled clk_get APIs. 

Aniket (3):
  dt-bindings: i3c: dw: Add apb clock binding
  i3c: dw: Use new *_enabled clk API
  i3c: dw: Add optional apb clock

 .../bindings/i3c/snps,dw-i3c-master.yaml          | 11 ++++++++++-
 drivers/i3c/master/dw-i3c-master.c                | 15 +++++----------
 drivers/i3c/master/dw-i3c-master.h                |  1 +
 3 files changed, 16 insertions(+), 11 deletions(-)

-- 
2.45.2.803.g4e1b14247a-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
