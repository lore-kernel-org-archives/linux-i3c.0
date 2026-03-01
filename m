Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864A6FD0062
	for <linux-i3c@archiver.kernel.org>; Sun,  1 Mar 2026 18:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RvxlwuWNVHNHYUogw/QceSSapkdIhYAxqcWK4w4qIG8=; b=zeBDvN3YGIfxaF
	E1crOXitEFBQ2maLA3LYfA8SvqzgeJmJjNbNWYDwPjfQif56ogiyrXw2xNfOUCe35W+6PNhdRC+5k
	Q2e31clbOUh7XSGxmqbo4qCXWguz2PWgdbSM4F8iwukZjdDlODqGef2Tg/zvXjdE+q5mXxIWPOYXs
	5hoxf4QBXtFfSkUadABAo3EXY4KRo9GGei3blyA+W3eRTIhiOgQxnDQFvxkwB4KQM9XugLw6LI3QY
	iiE60BQXXPJ1BEZgTHJoeS8bQIUOtRY2Pkv3TdpRzpk4KC7KJF4XnPJKnPufItQGTCZx3T3RU+0Ug
	pK0mwjV+tI3SUXjDjEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwlV6-0000000BmTa-44H9;
	Sun, 01 Mar 2026 18:26:44 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwlV4-0000000BmS4-1wfu
	for linux-i3c@lists.infradead.org;
	Sun, 01 Mar 2026 18:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772389561; x=1772994361; i=markus.elfring@web.de;
	bh=JPOwL5LtmwAUEhf9msAgnUvkNWjnm5zygJD8uU9vbqE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bhNm7VX8HMdpiRyCXetWF7gve5io8PFnJHli/H3BrGOaWbXiSjkSnXxzidQEw1UM
	 xyXC1DfYbKi8sRnJ4QnEQ//dvnGEPwy23ls7nHcRvWjEbcq/gn5OzPc9MM6gx2lbL
	 sL+t32DAOd7Wbd8LwsukF5BHTOcsIXvWKhs3+SO4ZWtfG6rwSYcMDM95Q8BkmGzas
	 5RqfCaGMa3Z+v5ZhIVbmJEG3Qx42zm7DG+Y3hbEP+Psj3HXhYcC4yDDwweEJICV4J
	 vfn2rowQi37f5iN9+Xl68/dPCwXi06l9sOq6VaMt64SZrimGgk8Fx6Mli61ZYwJjg
	 q/cLNqCI1DEgVU3EqQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6pUQ-1w2q1f34wQ-00CoBd; Sun, 01
 Mar 2026 19:26:01 +0100
Message-ID: <44203b94-0d4d-4411-9f9e-103ef19172b6@web.de>
Date: Sun, 1 Mar 2026 19:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
To: linux-i3c@lists.infradead.org,
 Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Aniket <aniketmaurya@google.com>, Frank Li <Frank.Li@nxp.com>,
 Fredrik Markstrom <fredrik.markstrom@est.tech>,
 Ivar Holmqvist <ivar.holmqvist@est.tech>,
 Jorge Marques <jorge.marques@analog.com>,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Zilin Guan <zilin@seu.edu.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 cocci@inria.fr, Jianhao Xu <jianhao.xu@seu.edu.cn>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] i3c: dw: Complete exception handling in
 dw_i3c_master_i3c_xfers()
X-Provags-ID: V03:K1:tSXVZHBbIK5xjwZhaygDWeHXQZPsCZsck/676Wjtcvh4u93PeYr
 0MwtMi79p0bxd9QiIcGKOAgyYWxB+S8AvQ7GfgW0Rm7krpt7bJDAKiKW6eD48rHe0bl9uHe
 7xunibjpnZI4Q55zfBU2GPKafg+EkE3p5y8dq+By6sgAZEX34SaCCGgF0p6oCid2U0caWha
 zZ4PzW4uVqB9qt9r8gg9g==
UI-OutboundReport: notjunk:1;M01:P0:zqdcEdI4ORA=;buusgYwo/qga8Ub7nO0ll3/K1dD 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 Q4FDUr9OZDEcdvidTmam
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_102642_883098_33390EAE 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 1 Mar 2026 19:11:51 +0100

A dw_i3c_xfer structure is allocated by a dw_i3c_master_alloc_xfer() call.
It is not released after a failed pm_runtime_resume_and_get() call.

Thus use an additional label so that the affected memory is always be freed
at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Fixes: 62fe9d06f5709caa1fa68055873ff279e05ade37 ("i3c: dw: Add power management support")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/i3c/master/dw-i3c-master.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d87bde3f7700..723f185584d0 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -953,7 +953,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 		dev_err(master->dev,
 			"<%s> cannot resume i3c bus master, err: %d\n",
 			__func__, ret);
-		return ret;
+		goto free_xfer;
 	}
 
 	for (i = 0; i < i3c_nxfers; i++) {
@@ -994,10 +994,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 			i3c_xfers[i].len = cmd->rx_len;
 	}
 
+	pm_runtime_put_autosuspend(master->dev);
 	ret = xfer->ret;
+free_xfer:
 	dw_i3c_master_free_xfer(xfer);
-
-	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
