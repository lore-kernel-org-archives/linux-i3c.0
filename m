Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFB3C30658
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 05:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4DByDTabaSlfjdZRqJQSAfVrgNAzFwy2JR2Wtujas2U=; b=z1Ggp69RJg6XqAbp7nd1D7FOLz
	VcTFiM4QWOlA1xeANmo+bx8cEp/rHk5/1TprcrBk4awFwMPm5e2jfxSxQTdQqef+6+LKzgRDc+hB9
	5yGaFBRGuVfxuG+j9NW+jD65OCIrg1RFZrQ/fO2/Fd6APgHkBAiEO/nZZMJpbwJBjPmP7l9x5cLO9
	Bj4z1KMmdgU6XkD9gAJtmclBdULdpgrqzx8mmAw1WwJ30mzBLoEvVju0uYxZ0asO9K9IleevER5oe
	+GagyaN/+kFSWmcBeIfcAcIdIXZ39eZLDH2M+CmqRW/bgefh/R2CUSeXoXdOSm/pgx0TgW+bwl/WX
	THpMiU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sML7Q-00000005RnZ-1o19;
	Wed, 26 Jun 2024 05:22:56 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sML7L-00000005Rl6-3opQ
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 05:22:55 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-63bab20bf5fso146530297b3.0
        for <linux-i3c@lists.infradead.org>; Tue, 25 Jun 2024 22:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719379370; x=1719984170; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f9jiGA4+KsY6Ibr0v4fJPXxwYeKjydGEY68SB+90XCs=;
        b=vOEhWsGtI04WCXB6pbQ2y0wexV9uIFswxMcaEGu0CdbzZ1Z9WWQ5xQ1Yf8Sjhlq4Wc
         KAWA1wygHy+2D8spU9zjnvDd8e8kK8OH75TIoUCPyejh0yI0u++i/QA+sV3fcOIbetAG
         T3CR8sRTD6P6Ea3litThiJ9OsOT8GymLxHGm4z0tzC8ROVXLJHKnnZAukp7btE20nhMz
         4Z9M44QL8DmXWbKO2ZtgM0aJ7R6rn34QT7SDTqBX7xmnqePHY6sg/ebbzrHB7S1RC4qZ
         JfOZncYq58CwYoi4BZEqvagaKI2Ta3ZIwwnTUJzoK/EkNsCVeKd0BFF61LHEEzwkAB2w
         oJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379370; x=1719984170;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9jiGA4+KsY6Ibr0v4fJPXxwYeKjydGEY68SB+90XCs=;
        b=HwdTK2TSF7bSaK0nG9y96h34sPVf+m5Z29zuh9NJMMEtPfJd3Sc7aaMrToCA9uJlUO
         naAAqewwPXpLUBzYC0mrOLfwy+hSzoQmDl2RjM9K69ublg68dUexVYiTjea1Q4V5Xnu9
         5wv732y2AZ+bhUM/DqV0MhAwpv5n/hMs84zN/tvjG108Zin+HaZ7MajSXcUwuSzx7Rav
         hnye5LwKNgwwT4/5wJX3O8FZUQypEeC7kHE7nXoZrBP6HHITKzSia2hU5JLH/uIIPo2c
         By62cp4dzZN/JdLLGaz+xbInMMFvxB+1TwllsDTpne2Pg8j6oSCadwuiTIGm4TMo6R+N
         2/Cg==
X-Gm-Message-State: AOJu0YzOzNW5XowSu8IDFLWnIcvjNVn35bfLDInuf2hlOR8P8yO6/w9q
	UsVpk1dxOhxh1W42Pv2AGdWI6jiffoJTzuPPF37NqJHpX0klWcj0RvilckiK4xZMzHfzcf0OOqD
	2cvtqx/qJvuQF/AggawZAUSvCOA==
X-Google-Smtp-Source: AGHT+IEPyF0Z4bQtX59+73aKE0baxBQClOtOaCiHEOoPqLHrjgfI1SuTNVKmjRu5xi+hpp+RcAEoWSMDOiLVvyIP/vE=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:690c:3602:b0:62d:a29:53a0 with
 SMTP id 00721157ae682-6434041982bmr1536087b3.7.1719379369752; Tue, 25 Jun
 2024 22:22:49 -0700 (PDT)
Date: Wed, 26 Jun 2024 05:22:37 +0000
In-Reply-To: <20240626052238.1577580-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240626052238.1577580-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240626052238.1577580-2-aniketmaurya@google.com>
Subject: [PATCH 1/2] dt-bindings: i3c: dw: Add property to select IBI ops
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_222252_728664_7D1CA0AD 
X-CRM114-Status: UNSURE (   8.23  )
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

Use this property to select IBI related ops in the base platform driver.
Otherwise the driver defaults to return EINVAL for any IBI requests.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index c0e805e531be..08c8ccdef691 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -25,6 +25,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  ibi-capable:
+    description: Set to select IBI ops.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.45.2.741.gdbec12cfda-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
