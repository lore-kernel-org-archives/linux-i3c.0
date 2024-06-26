Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781C2C27C4F
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 05:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oYpiCAMQVTPuXHXGxU3yvTvS2Ab0ZxGmcY8k2MEF6rQ=; b=i4D
	DCSxjR/EYcmXXu8DBNIhntcAFeCh3Rr5eD791Bn3sZ/RLKXP5RbY7fOU1e2sOp2u7ybXzcocfQpX3
	5VsFlT7DH6sVjUK/Z9OExjjEVODF0siu7kdwJAHXj2vwAlKdBHNmZpOsFnhtyocYy5x3fEt7oVabn
	sY2Jpv3o3WVFmbKS4I9Y8OcSU+7tg66MPNc4IIQyr1eSnpXqh+/zSJx012ytCybeAKo1PkqYEX9xG
	t1V8EA7OXoniQf3RTaVP/niIx/FjWnodJEccgomksfSPCkfA5J/cnzwtyhSvTEt1dGgSf1qKrNCsH
	vTQBL/FkMaag78BvbpmO3+ig2i75XVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sML7P-00000005Rmv-1wp1;
	Wed, 26 Jun 2024 05:22:55 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sML7H-00000005Riw-0KiO
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 05:22:53 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-646f6df9683so34130417b3.2
        for <linux-i3c@lists.infradead.org>; Tue, 25 Jun 2024 22:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719379365; x=1719984165; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PvKOlYXT6DEYuH52e2UV3CHMNpzpAZjsjgVTw3pHU3M=;
        b=Shs1Y+bi7fB/y6AV93x0EIATTtiNsZusZb5oOfJLqFifcfjvSUsM1N8zBd4EavKe3i
         qmKjk8+ANF4j4+gLKmMGerifPZOME/kQdzyw2uiwlnVJHW+v6uCzq37UzU90qAhXUIsq
         8woDC51IrS9yPmxLA7OCiuzBC+GvOYTg67JOinRl9aR9ghz9x0icT8jiCGrrhlUyusBY
         x46Pn6qF8qRddKKpryd9TVgmMsBzKN/mFRu+Wg5Sxln4Pm89zlyTdaak6y8f2FYNDWuq
         IzuJvRUJQJyOda4zFCQxjcXvmJ7h2I5OZm0mU57siwtOFvwx46PkggSb5Q6/LMjfH3l1
         Oe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379365; x=1719984165;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvKOlYXT6DEYuH52e2UV3CHMNpzpAZjsjgVTw3pHU3M=;
        b=UNGDvXy2BGV7lXnZIf+XjlkltgknCyox8yf613GCwERvsEmL78GIeM6I37dG27k1C+
         1XTS/+iHyXI2VJIVBkQyqRkl0GAe1iQB693+SAeLvtSzsnr9yr+qSFPIZU3pPA3I+5OH
         SCT2Xa7rEzitKECTaOV1QohZlRl/DbDDJrVlLdlSg2dxxGsM2NYEVSLeOVg7zQO57tTk
         M4RLWIRcG48LhxrTNvNwo9sbpNUCoqWhk0E3qs+fOQn1KkG2QocWQZvnxtNA+F7B6IUd
         yXuM23Nm6cAEfrzr5sP1V6K4znA+3VmhteS3dmtq7Zn2JA81Hcrc4gkUiG7qkMGPfqoQ
         yukQ==
X-Gm-Message-State: AOJu0Yy0khkK8CBjYlHguQllMNFLUtpdCkmrz5cGer59Wc/YxMufU4RX
	aUs/og5yKSGYYopC45OAC3hIHQYbC+YUgQwKijxZ/rFYgkqS1XLDW6vKC3+70ZuKR1z+XHiOKbq
	JLiJCWP6NMwtF2o801woc6NXdDg==
X-Google-Smtp-Source: AGHT+IGzl8x7DxVv6F3p8R1sVwIyMgFIzmWoKOItdjSMIzZLcv+zWyJvzolxM68jTcTziqMHoGm4QEXPpeTlvxEJdYY=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a25:e056:0:b0:e02:bdcd:3bd4 with SMTP
 id 3f1490d57ef6-e03040e5ea3mr320815276.12.1719379364918; Tue, 25 Jun 2024
 22:22:44 -0700 (PDT)
Date: Wed, 26 Jun 2024 05:22:36 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240626052238.1577580-1-aniketmaurya@google.com>
Subject: [PATCH 0/2] Select IBI ops for base platform
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_222247_437609_7929F0A4 
X-CRM114-Status: UNSURE (   6.11  )
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

This adds the option to select ibi ops for base platform driver

Aniket (2):
  dt-bindings: i3c: dw: Add property to select IBI ops
  i3c: dw: Select ibi ops for base platform driver

 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 4 ++++
 drivers/i3c/master/dw-i3c-master.c                            | 3 +++
 2 files changed, 7 insertions(+)

-- 
2.45.2.741.gdbec12cfda-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
