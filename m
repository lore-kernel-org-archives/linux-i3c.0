Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A255AC3271E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jul 2024 06:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VYHFu2ABZf0J5SrGK9J+PA7WxrEDwlyVwYt5FtZrDSA=; b=N0B
	fdEdFmwtqLZf7kjb9pFmcd1t0NOghXyIRFjQjhzxL3zCLFMK0yZOPoHKTnY7MTctJJgfeT2qpB/6J
	FaS+cRmyUZxpILQUcjWv3WYOmjNnjjzzsSjJfmK3ncAXdlm5d4UgyvOh2YG8K7FiXn2ptQdNdZziR
	VCPBPA5MtdKd5ZlSlKoUd0R9O+4dCkug7j0fA/p008oc9TATuOU+JIT6Ju0S6N0mUvlrOmX2RK74y
	ffT00/uJG/vPTB495FjaIKCIpWOHDyzz1VbJDz+gZqw61anxbkbQlzciNV/lFUfHjdpcbfc5dul8C
	ANuFUQAhDcd3PQ02p5qi7Uh9K5aUHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhkS-00000002rLu-3tnt;
	Mon, 08 Jul 2024 06:21:17 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhkP-00000002rL2-3un4
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jul 2024 06:21:15 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-64c3f08ca52so61538347b3.3
        for <linux-i3c@lists.infradead.org>; Sun, 07 Jul 2024 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720419672; x=1721024472; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5XuMB4jWfTK+nrsq0Cd41neWZ7Zk32YaXzBOwDdVumM=;
        b=JFBGI3+KHXPVaCFzQaK42IItj95EIIqAEldrYl6cwjAd6aZ8tm/11pxe8TsjcWo4Gh
         SXQwtfJ78JCMS2DIruO9+k+sAt8XPeK7YkoN9YcJrghKmcNUvxVuznZsJuaUrKkzdMzU
         IQct4BGWBEPdwpLmcvp7sfNUsubjxUcPbEXGVN75wrWl39GDQh62MDXtgACLni6njU3b
         IZyS+E/gmQyXwzqGbQLPatW/byVlyanx67pd1lc4t8qSPfqRfKfrbDOBiaM7CUpPxlWB
         NsZQKwUSpDwniLPrO1EbHyZN+oE02uOhXKXEIpRTw7TM+wxrsUV2hIqc9tmyHhv9guT/
         vm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720419672; x=1721024472;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XuMB4jWfTK+nrsq0Cd41neWZ7Zk32YaXzBOwDdVumM=;
        b=krkCPPqsINHNBQTWuiayYL6VhhCy8ZU5eFCQNO6owJUbbfJPjNZ0OJTuQwUeOWAjVr
         JQz5I9Ou3xSLM3LIOsFJrraeHjyRghP/iQqjv9ndXMuPxYIZzPF2MncSRRUz/WIicBVY
         l0a+xuU00AwPJE2MtsQ4uEw+NpuTzTn1597fcGditiXW1XXIjyyqzUkpGHX5KQhAozzS
         SpdT9oeeY8QSjeAPfBWxnSOVI20IoO2THPJN7oZjBMQnhgm8u6AQKwCBufgmU2D1hltP
         3ne6bgehjSPXdC7KQ6pG7wAng+oWI4qsGi/ATdYTrwV+ooDa8r/bqrtpQCkemNk2wJll
         p1Sg==
X-Gm-Message-State: AOJu0Yz6ko6QBRnBHYryWb0D5q030K2pWnszB71DYlqTubs/c7M0ulow
	HHO6SNBM15F9TTSQDekuDIYHE6dLskvzthvmW6UV1yik86VtIzGOYRCmjtsW8OPtVfADiDf9mc9
	BHYottX6ukYYOyrklg+9GWwUe0A==
X-Google-Smtp-Source: AGHT+IG3AtsLI4pAN26wbfZ8bsC5JGvZOcnS9yABDyajFuFbZomTBMcMqoD+dcfc9zTQ3Rn1s2WlpoOvRRXwXHRnnvo=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:2b85:b0:e03:5220:a9df with
 SMTP id 3f1490d57ef6-e03c162e79fmr1172527276.0.1720419672035; Sun, 07 Jul
 2024 23:21:12 -0700 (PDT)
Date: Mon,  8 Jul 2024 06:21:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240708062103.3296587-1-aniketmaurya@google.com>
Subject: [PATCH 0/3] i3c: dw: Add support for power management
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	vamshigajjela@google.com, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_232114_022066_13800026 
X-CRM114-Status: UNSURE (   8.56  )
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

These patches add pm support for the dw i3c controller.
Controller registers that can be lost are saved and restored during resume.
Clocks, resets and pads are put in their relevant state during suspend and resume.
For runtime pm, power is resumed and later suspended for the xfer/IBI APIs.

Aniket (3):
  i3c: dw: Save timing registers and other values
  i3c: dw: Add some functions for reusability
  i3c: dw: Add power management support

 drivers/i3c/master/dw-i3c-master.c | 302 ++++++++++++++++++++++++-----
 drivers/i3c/master/dw-i3c-master.h |  10 +
 2 files changed, 266 insertions(+), 46 deletions(-)

-- 
2.45.2.803.g4e1b14247a-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
