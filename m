Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C2CC9830B
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Sep 2026 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9J5QkH1uBUTCnpFsifP1L6cSGM377pJG/KIkUybCbM0=; b=aC/M+WjOFTPRoo
	epUkSMY0HTFfRPQAlLSIvYv0W3epyWq2/Lv0BVONSNQeIm+q7KPLMaRRPpB5T+oc2SbfiU8B8yMrW
	z/MIXe5UPVeDbMjnlDM91FhxFvU0V2DF3TDbL9Ta1dXB9fcP1NRJxdXFjO7bkUdVA85Q5IZpLt/WQ
	cUbOQcbtDVfNJtzzmSj0q+9VV3TxCIWBcFaRZA6vbW4LxGTMJ4QcjIgTNul1SCbSIvDKWK5NLTW62
	a8FFyYkuXRZcwMYHL6+ccmfJGTh6CeBKhpb07feaCS6KKZz5rGIkNHrIQMBYEuw1WeEuu/aDKE1dG
	4zDnGfmiwF4WwWtTuzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PBm-00000008nb9-02Lp;
	Wed, 23 Sep 2026 15:47:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PBj-00000008naO-2lQu
	for linux-i3c@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=ZGi+48YLm29g6ChPmZEqo73QE8c2OeG07oFWP96bX5k=; b=ov1emofuz+4Efh7V2ifpp9p/v9
	S7rKYc/oRZs+Q3iHmVXciikO/lPJGvU6TCnxpZIBWh9ctdgb6qeFpeWqZ8DQ6yUlnMkJswPL4Aqv9
	DCWWegzO5gJIqALWuKPtqpShA6piv1uo6q0LL+qK6f1CP5yBLaDM5137TUhhOo1grdRlN40ULqPoJ
	s5sJdcXYA5EyioSrmnqL4JekNlDsF+p0wcrxoGGm4BzGJzMU6GWh9Ad7mqTsv6QrY8lxAVH9Q8WA3
	RzW6TSpz/vGuFKPxOhgPe3WI4FSkXPW488bcM9VaTE1d13N2J9jE9m8DvMppgNHmxS/2wDzFY/cmx
	MDGMMqFw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9PBg-0000000ExwM-1CbO
	for linux-i3c@lists.infradead.org;
	Wed, 23 Sep 2026 15:47:14 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b965f447cso8512485e9.3
        for <linux-i3c@lists.infradead.org>; Wed, 23 Sep 2026 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1790178428; x=1790783228; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZGi+48YLm29g6ChPmZEqo73QE8c2OeG07oFWP96bX5k=;
        b=RKV8djaHxkcwHxpwAlNICOTTUfD1HY6swHPFXy9ml3omiVKtF2vGGSatqerQ54Czrq
         s/M5QNaSvL8AeIc8f60gQXSvpSm0/cMlBtLY7MQtQeJsmIp4sIPRYaMfcF2cqCaPZg3A
         aBf1qEQJK8+hGfCONL75FDTlHl19vHdgA4FKaTFgYHyIkBDj5tEenzAY3jUMeN9rU3EL
         /pLuWhM3ds7wqVz92N6cUCB4KeD295CTqTqFJpRYRGd803TezehjyMujn/D8tp4g5Cse
         k3GWINQ+jycrx/lTetSuPyUH5Du8DN6Q3u0FzF7LJzQZQSNciDIobki0PNVWLYBwRVsx
         I9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178428; x=1790783228;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZGi+48YLm29g6ChPmZEqo73QE8c2OeG07oFWP96bX5k=;
        b=1sS9rYSoQGll7jt1FGrpQ1/2uuHe8FbsM8eQctBIMEkfs3yFqNxbbX91wnvZeQRHJc
         g2DEWJENk8lVSQdNP2/POll5hbGJA8vw0DVrzYdVmdf6ONGkga2/EvfYgtEbwzm76NEB
         ZMgPenPFrfO64uMTN4pfGmReeTc6LvV96V7p+S1MJ//Tqarjae9wmM9Hmh+XM6fxVyzj
         EgtP+GLJg6LThvw0z1chB0XZsNEbFWuNP2IapwxE3xyQexUxXppxsqDk/CkdowwfKkFw
         LexpCgpEP1eGRITNcRdRRo8a0BRA4O9GIaW009tjXC7JvIccPxPObdWOrZVX4Z2yi/Zs
         hrIg==
X-Gm-Message-State: AFuF++n/OvS8eTTkJsLHdrr+ipgrgF+ySrBuIOMJU3BjcFiJUVjuQWwj
	/v6mdoxqoTaoodfFa/S9wEjlJKAE3U6VEq0tL+STWU1mhOXLRFloT4PWV1LLn2OgHnlO2RUzMey
	S1rBJBGs=
X-Gm-Gg: AYBFou1Zl4FYMfr5mBwVZtf01b24uQIG6w+u96NM7uXjPydooFpT/Ger2Yc7iCYxo6o
	AHk/hlhk7XlRgh7BjtHFMCr2dvCVFk/kQcU8/uKH5/StedyWPm1WRp3n8n3REwT2GjxEC2bIu+k
	vuiee8RbdJ5X/4ACob3gu8iLZUtoRzU94m/HhyPTTM172wJMgWv2YKZ1EjVXfLvxK5CZVLOZRoJ
	8CszBsXt2vRP7YZFD3VDLFBOkvo/sP+j/fukw0mnnEToIVwlCxaG8ZVtyezNtPoC1bl7vlH6Uzx
	qioW7tefO86rG37osKhIfTYjPgTLgUKoP1ISUZ1nctG8W2eIAT/I+uWWKIpe1bF4YlwR2/YKcwN
	0EIfivDIpgNPRcXYdNHrhOj0aNfUkt0EGOOmSnChOzlioac6hyOEvTlKS+ZedRJeVQmUgB5lhb/
	xnWK/7vPEKyaVxqT+0xsWortgt4/mX1Ang47kM1rNsEmn4TXr/sQtvYDAf5dmRzZhyYKk1fcLfu
	MLxFNsM9uuK+sYX2iCkXFZ3qQ==
X-Received: by 2002:a05:600c:6208:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49fdee0b744mr40622635e9.7.1790178428328;
        Wed, 23 Sep 2026 08:47:08 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:5946:670b:fefb:2ebc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm85846375e9.14.2026.09.23.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:47:07 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 23 Sep 2026 16:47:05 +0100
Subject: [PATCH] i3c: master: use named initializers for acpi_device_id
MIME-Version: 1.0
Message-Id: <20260923-acpi-i3c-v1-1-2e78ebef251e@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAHj0s2oC/yXMyw5AMBCF4VeRWWtSrfuriEWNwVggLSKRvrti+
 SX/OTc4skwO6ugGSyc7XpeAJI4AJ7OMJLgPBiVVLiulhcGNBWsUKWKWlKakougg5Julga/vqml
 /u6ObCfd3D94/IupB/WwAAAA=
X-Change-ID: 20260923-acpi-i3c-4cc518a8e77b
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790178427; l=3578;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=XVO6J06mWLfpj7M6Un0o8+TeKp7Jb9GRavOx6vrjjTw=;
 b=dM98K8eXKNtZwoIDuKKK7dvMgG8ppYp/KLOox2m0fqs6EbRBkXZesrgZ8BoHM0Eiy2Js6I2PN
 ZAlwOozfk22BZt+Hkx8zPpgmCLMeox2ctCXzyuaGG0tF2IvEuyvJRns
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_164712_542726_A3249299 
X-CRM114-Status: GOOD (  16.69  )
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

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc4.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/i3c/master/dw-i3c-master.c     | 4 ++--
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 4563d8761ba0..05584ddaf104 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1934,8 +1934,8 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
 static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
-	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
-	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
+	{ .id = "AMDI0015", .driver_data = AMD_I3C_OD_PP_TIMING },
+	{ .id = "NVDA2018", .driver_data = DW_I3C_ACPI_SKIP_CLK_RST },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dadf049bd4b5..5b8d84d0106e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1205,8 +1205,10 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
 
 static const struct acpi_device_id i3c_hci_acpi_match[] = {
-	{ "AMDI5017", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING | HCI_QUIRK_RESP_BUF_THLD },
-	{}
+	{ .id = "AMDI5017",
+	  .driver_data = HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
+					 HCI_QUIRK_RESP_BUF_THLD },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
 

---
base-commit: fe2ec83746e501645709761605c2464a44fd2929
change-id: 20260923-acpi-i3c-4cc518a8e77b

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
