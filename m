Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D31BC6FD19
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Mar 2023 21:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5kYtXOLbF8LB+np7W3lo7FrJo5Acgatwy1OHjYYjXeI=; b=M3M/O3sHu2z3O6
	5XnEP6oX6nDnA8zwTI9NwrkRdfpwBKkwaBDk86G/QfGCPGU9iJpoywK2oilVvfwv79Hp9VhxORpuq
	ttV6OPvJo+1LgC3LK1E7BZHbBWYxBlzvZKoYH1dGqrKUGylXuetZpR1aGX08OZxrWKpgZtQGoJBeI
	hs5d421dq6HrCZkdLAi534KRgBTiHcflFOhWfyHdqkFdz94JDKKka6jd85a+hqmKl97C6f0fYgXLd
	89goXF9mM/Y+QxRE6LMkfa8TOrohvQnMvio8jrYvX57jGPhfrQfJWy20JbSEuqnmcpmBo4j9MBQ1J
	YtWk1kBuHV3yuYxmTDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSuv-003bP3-VY; Sun, 12 Mar 2023 21:07:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLhl-002OOl-8Q
	for linux-i3c@lists.infradead.org; Sun, 12 Mar 2023 13:25:43 +0000
Received: by mail-ed1-x530.google.com with SMTP id ek18so7445390edb.6
        for <linux-i3c@lists.infradead.org>; Sun, 12 Mar 2023 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678627537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXeUy3HcdztCB0Ld8qfPoUhK1lKlns3n47t71MgWEBM=;
        b=Dd3U7NSZWiATgzwzUFgKjIv4WIaS5m8ab5QYcHS6kj63tjLo1Vbw9IL0rURdCKjKUx
         XLFPZSa86OIETw9hGe+GrihBdFy2H7zKwwQIexL61xTRq7UY6ExW9D33eSG8sns5TsMH
         WyVGdLuvTUARRMaojGsp98TzjT510g/Iii3FnLwdhAMCpxp0orpo6rDdy9pPZMHvgMKD
         DITSxsFawNBW3kIqctlZ4eRF9ASb4fKEU+JvB82/fBwuQO7FgRafpm3/3HTvDP0R2Gys
         LfF0qeyHbH57yYUNuQ+4QRxMq2fVw0KoHDZ0dcayguxlBsRbZFOlDj/rJk9ShRJicvtt
         hRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678627537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXeUy3HcdztCB0Ld8qfPoUhK1lKlns3n47t71MgWEBM=;
        b=Skmq1j9WDnmku6yuKHCcR2MUmCwBQDpVgTOEt3dTRaqN328Op7gPWu0MCmcHmvjz+r
         KnnopEY8+UowYoEdDVbh8je6E7kJofvbs8m+4CUTkz3k7KLJEgdVwXw24gRMSvsQpKOr
         sOXI5bWUjaNIxnimG3GvoOFa5TeZiM9zFgiSK0IFO0JnxxsGWmBd1t63fwG9OQ9o4Vel
         QaxJshXJXFBJIPIvj23Sro1wVjiBmMU7SAelpNfSO2ldpd0yalbviRHlRP7OSSLE12di
         5IkQ/34dQwouCO8EJGpnERP3B82pt45vPe+gFwJda8RKcrYSauDkK2s0Bmqf3NurPP1N
         Af8A==
X-Gm-Message-State: AO0yUKUwfs8QXbbX5yhRHT3nYgC0KZRW03Fo8eygzhfosod/2ABNl2WH
	JsZLy+B4yTQe/XMaKdPOu8oqSVy0QSXxAWplRGc=
X-Google-Smtp-Source: AK7set/Lmvmw41Sctc9aj29/JgR5CI7HO1/JK5pXtKXHE/wmNwgU58jaxQF9y5cZAEGxFauentONOg==
X-Received: by 2002:aa7:c1c4:0:b0:4c5:bc48:d422 with SMTP id d4-20020aa7c1c4000000b004c5bc48d422mr25696218edp.7.1678627537160;
        Sun, 12 Mar 2023 06:25:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id i23-20020a508717000000b004bc422b58a2sm2171320edb.88.2023.03.12.06.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:25:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] i3c: dw: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:25:35 +0100
Message-Id: <20230312132535.352246-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_062541_354035_A8D01CA4 
X-CRM114-Status: GOOD (  13.41  )
X-Mailman-Approved-At: Sun, 12 Mar 2023 14:07:45 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLiAgVGhpcwphbHNvIGZpeGVz
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmM6
MTIwMTozNDogZXJyb3I6IOKAmGR3X2kzY19tYXN0ZXJfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQg
bm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0t
CiBkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFz
dGVyLmMKaW5kZXggNDg5NTRkM2U2NTcxLi40ODU5ZGQ3NTM4OGQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3
LWkzYy1tYXN0ZXIuYwpAQCAtMTIwOSw3ICsxMjA5LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9y
bV9kcml2ZXIgZHdfaTNjX2RyaXZlciA9IHsKIAkucmVtb3ZlID0gZHdfaTNjX3JlbW92ZSwKIAku
ZHJpdmVyID0gewogCQkubmFtZSA9ICJkdy1pM2MtbWFzdGVyIiwKLQkJLm9mX21hdGNoX3RhYmxl
ID0gb2ZfbWF0Y2hfcHRyKGR3X2kzY19tYXN0ZXJfb2ZfbWF0Y2gpLAorCQkub2ZfbWF0Y2hfdGFi
bGUgPSBkd19pM2NfbWFzdGVyX29mX21hdGNoLAogCX0sCiB9OwogbW9kdWxlX3BsYXRmb3JtX2Ry
aXZlcihkd19pM2NfZHJpdmVyKTsKLS0gCjIuMzQuMQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
