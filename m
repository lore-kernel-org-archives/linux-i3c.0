Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D9EC77B61
	for <linux-i3c@archiver.kernel.org>; Mon,  1 May 2023 10:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O+1t7IXnQnsrRKt3VPEf+p5jaF7WyPwktt0Hq1IXOug=; b=z8WqN7WWdtQ3Vy
	mi1U5jo8DlviiXb4KhrKFRnxGmM3R1cTrUn+ccyq0KRqaDkHxpAp9qTHGhMY1oVKQtXESLNbmL8Yo
	yUE9ZjUNJQ4xg78kQjGTnphPWpSFBO1Mzc7o0Cv1S7Hl64sdG7v2WwQO0+aGemki8XB3E4aJRItN/
	2nlWoUzuMctZ5MgXsxgRsnm4IT+NmtI0rfKZHGA48n/1zu7kbygRQDidJsb2xYy+MRfirbX1bqMpP
	b6ygmMFVarS46Dgili1hSh70QgXN73jO95vT0qhOp/dxR6pG0EpzwwcVMA4mbK8J257WlCjawq5DW
	fCkDh1fAnf1SWsJ6fWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptQg7-00FaQa-2y;
	Mon, 01 May 2023 10:22:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psktw-00CmRO-1V
	for linux-i3c@lists.infradead.org;
	Sat, 29 Apr 2023 13:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682775967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MrC2Plo9OYii15Nm2M6PoTQXMjK5jmikMyISz9U2Pqs=;
	b=HQwobudDfGpbMWyq4gH44D5b5WQ9vZZIzaycMAogMIjgSl9ZZ2Td8QfvWlPKFoKPDhV8Fb
	OJRksqScTzIEHfdSFXsTCT+tdLvu73lJm3REtkrUjt4Z8T/FwFEzi6nH5YwHrZb/Mv9PGT
	A9gyxH3qUrnIDqVI/mGWAkvCa4sUWdk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-bcaUjdmTOpuXFNERYfdfsA-1; Sat, 29 Apr 2023 09:46:06 -0400
X-MC-Unique: bcaUjdmTOpuXFNERYfdfsA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-5eb18c93187so5799566d6.1
        for <linux-i3c@lists.infradead.org>; Sat, 29 Apr 2023 06:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682775966; x=1685367966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrC2Plo9OYii15Nm2M6PoTQXMjK5jmikMyISz9U2Pqs=;
        b=VZQ5m9tP88azzLYMQ8RX6OxTjbcNX7RY0soZxsrymOFleGAsnReNpWPgbVSjjarNDf
         OYAF/Ar7SBVRyyTHsar1vqQ1BCnqThkZ07eWMgeZOetYNxvKIWwI8zzqvRfPGi2pcqzA
         WPNMAOc7ptrIcQqCbmuJmKJ1PD26r2d9tEFyiarQAU+fZQU6VtrFmu1/uK6/ndngCQpf
         NTbPwquYrUAsQwHwwlzdLwe1c6jfo989AoK+RLN4AByxlYD1E1pxxK8oSfyL+YtXI+i1
         VhAuT7vy3/o922QtBlSQwi1C03aueBwEFpVeMUkQs4ajktokNmPpO/swDmtDPwzh/2uS
         Bg6g==
X-Gm-Message-State: AC+VfDzrh7P3mZpncIvehBed7MCJf8ZLQYxkcNDMnHVjLo7eOP5z2jcg
	ttoNMR6x+vfhY+Ap7GFUETDOZa5B/Me5oW98lLEQX5vnXCkd3l+ljD0O8Bwuc/DUI6fam5XkyLu
	tqQcVJLTo8k1wquYW54rFhRor4g==
X-Received: by 2002:a05:6214:23c9:b0:5ef:a5b5:5b99 with SMTP id hr9-20020a05621423c900b005efa5b55b99mr15853764qvb.0.1682775966166;
        Sat, 29 Apr 2023 06:46:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ49CsiS83CUAu+aC5eNde28TyzbGRWjnbNx01U3hlQtODmk55RuB0tMAIfLw0kfaG9RSSmiNw==
X-Received: by 2002:a05:6214:23c9:b0:5ef:a5b5:5b99 with SMTP id hr9-20020a05621423c900b005efa5b55b99mr15853582qvb.0.1682775963891;
        Sat, 29 Apr 2023 06:46:03 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i7-20020a056214030700b005eedb5cebd1sm7112753qvu.130.2023.04.29.06.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 06:46:03 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: jk@codeconstruct.com.au,
	alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] i3c: ast2600: set variable ast2600_i3c_ops storage-class-specifier to static
Date: Sat, 29 Apr 2023 09:46:01 -0400
Message-Id: <20230429134601.2688558-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_064612_740447_C3FB8EAF 
X-CRM114-Status: GOOD (  10.50  )
X-Mailman-Approved-At: Mon, 01 May 2023 03:22:42 -0700
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

smatch reports
drivers/i3c/master/ast2600-i3c-master.c:121:34: warning: symbol
  'ast2600_i3c_ops' was not declared. Should it be static?

This variable is only used in its defining file, so it should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/i3c/master/ast2600-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
index b72c12c5168f..09ed19d489e9 100644
--- a/drivers/i3c/master/ast2600-i3c-master.c
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -118,7 +118,7 @@ static void ast2600_i3c_set_dat_ibi(struct dw_i3c_master *i3c,
 	}
 }
 
-const struct dw_i3c_platform_ops ast2600_i3c_ops = {
+static const struct dw_i3c_platform_ops ast2600_i3c_ops = {
 	.init = ast2600_i3c_init,
 	.set_dat_ibi = ast2600_i3c_set_dat_ibi,
 };
-- 
2.27.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
