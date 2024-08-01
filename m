Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584F1C3DA64
	for <linux-i3c@archiver.kernel.org>; Thu,  1 Aug 2024 07:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iHtGkuYd11AFwJ73nezcsQKujPx5iw1D0CQmJUlOv3w=; b=EBwtI1Qr4zzm+b
	JmNtn2IzAhzxuFp3w+Db1LHmHkNSo5jztVe9Uge0tSBkp68KM/nImcRKPZVX0rOG5WLM8OeYThOQq
	FaE/qVFw+rdxABsoh+uJjQRZhd9gLCVS9SLuMA7aL5hxLXNTs4OLdzxvWWuyEhKjW9XUxVvqS6N7u
	K61QSD6E+bD+aaWOkOQDjAAa51CNg3EcGJRLZ5gDbQGWRZKrLhZY72uYayA6nfHM8S3LSVu+bkK18
	fI2fk/3R6lIzeYZyNN51Q9QBVUBzBigy6MYJ9c3cLNOsRu9dt/GB36yMXT8E2b+Ul4jjV4sxx0mo0
	fWldS0uyy0brpDFZ6cLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQ8X-000000049G5-3IgN;
	Thu, 01 Aug 2024 07:22:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQ8V-000000049FJ-0X26
	for linux-i3c@lists.infradead.org;
	Thu, 01 Aug 2024 07:22:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fc53f91ed3so3114585ad.0
        for <linux-i3c@lists.infradead.org>; Thu, 01 Aug 2024 00:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722496926; x=1723101726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5saQIelnl5OO8WPHKquus0jHfZjg65IIuO1MIHrvlo=;
        b=g2+1SVfmrkbZCoR7lW+diTOfWYRf5WIi1hnJPtkwJU3qfgOBopNo6CLHv+dEXz44Ud
         iJXahpClEzw7zcXgFnuIQGlvUnRPthAFr3x9Duom35Z/mzutRQHEtVPPAIeMZ1qiEnb7
         /ObFGwEUm/7uDX+78pUSPQrnSXbmBnfJnFd94BlxHo+hAH5XmuORJTAVClKmFXMSgDdJ
         R5ec0iVut1CoHDtxhddXRWVt/AdBFv7xCkN+j38l+7MMorRUoYAKEu506Uam3R+HC+LP
         afMl+4VIPq6ehxIhNjDKOEZR0Tm7hxxG8Qxdk3yUxR6JBQmULzvtVdIRd8IKpVFIzdDw
         0DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722496926; x=1723101726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5saQIelnl5OO8WPHKquus0jHfZjg65IIuO1MIHrvlo=;
        b=rVd4Jly6wwxpG3pIJgGp8Y+nNHXoSUzku5hv9/tt01MN/aGQbhQ27oOtYBIea3zP7W
         YaUv2l0K5sPuWOXeokeF00OceJUqjgg7cZd3fMSCkWrtreAZUT3ESZthviIJf3V9rHd4
         3VmIxUCA3QdJrCf/yi/KsruBOmaJlrVUmv+TXhc3fW9OTq4k5hHAIuINYBvWBuBLf4DI
         Q5P/Skr+hNqJshemGT1PYH4rRVULoV6UqYQ2uAdIpgTmI7etZV3vn5KFGE7QFaYz1C32
         wrF4XOaccPiLtNfYbi6r6FPy6I5zVfWvi98bWyRL8w6oKccT05D1mddVOVuOlSBS7xRE
         EXEA==
X-Forwarded-Encrypted: i=1; AJvYcCUyoVpdMsyBUdk5b+NKkhad25AyFDkX459+rwqCoOzUjrwGKKNb3r3geq73z9wvrA1jkQ4nrSwwDm808ym2RKaocX6T45iMsi96pzFf2g==
X-Gm-Message-State: AOJu0YytCFw8qTvNpKGDEa8/fHjlm7p6UsYOdmZNTDBQtxnYDIEbdV1P
	EapvxHvgYqRnZuz91xmyVqjKlJ//MkxmCGwJRMH0QlAzCageFurt
X-Google-Smtp-Source: AGHT+IHUHvtIh/kWhOh8dQWKVm3MpKjD4RBmZA1KbW6roshsKEQC5OBsJe+hhqYENADb+J2mP+wZzg==
X-Received: by 2002:a17:903:2292:b0:1fd:a428:a021 with SMTP id d9443c01a7336-1ff4d2ee5e9mr12437505ad.11.1722496925777;
        Thu, 01 Aug 2024 00:22:05 -0700 (PDT)
Received: from cs20-buildserver.. ([180.217.140.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff4619793bsm22117425ad.120.2024.08.01.00.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 00:22:05 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com,
	cpchiang1@nuvoton.com
Subject: [PATCH v1 0/2] Add Nuvoton NPCM845 i3c master driver
Date: Thu,  1 Aug 2024 15:19:44 +0800
Message-Id: <20240801071946.43266-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_002207_183933_212D38F0 
X-CRM114-Status: UNSURE (   8.78  )
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

This patchset adds i3c master support for the Nuvoton
Arbel NPCM8XX Board Management controller (BMC) SoC family.

The Nuvoton npcm845 i3c controller implements I3C master functionality
as defined in the MIPI Alliance Specification for I3C, Version 1.0.

This patchset was tested on the Arbel NPCM8XX evaluation board.

James Chiang (2):
  dt-bindings: i3c: Add NPCM845 i3c controller
  i3c: master: Add Nuvoton npcm845 i3c master driver

 .../bindings/i3c/nuvoton,i3c-master.yaml      |  113 +
 MAINTAINERS                                   |    7 +
 drivers/i3c/master/Kconfig                    |   14 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/npcm845-i3c-master.c       | 2372 +++++++++++++++++
 5 files changed, 2507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
 create mode 100644 drivers/i3c/master/npcm845-i3c-master.c

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
