Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9890105F781
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Mar 2026 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgE+DzDl7Vr65XXzRmvCW/7sUdEsauUvtbyNSPfbj4M=; b=Nf77p1L6c4nCMM
	mtPo/ITKnxPIBcsFcqViHVSexhuv2i0yQGl/854pEs53JvPUGFC7TUmDI0ztuMGmXXp0ZVLv0Zl12
	rtPCYwvE0g4WU0c4xN52x3/19aLAJOzrmjQk3vQthpZf+0Ib9JakQOU7Nm33ZLROMAK9fyvVLx8hY
	F4UtLTKFAnnpXj4ieUsuwf/kaU1TAiwKIikjIsV3c23w6bqZQYZef9qGRWidyeH6LJ1NoASf2NDCa
	UxxyX/M14pVSm/SDeuw70+FTwHSlNSFUvQiq0tXxzwjKVaY1WK3GwSFG2HC1mHeyWHngsot7ulo/4
	yygAB0DJ3f6z2aBhP8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z8o-0000000HQLE-1oFQ;
	Fri, 13 Mar 2026 09:49:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z8k-0000000HQIp-3eFx
	for linux-i3c@lists.infradead.org;
	Fri, 13 Mar 2026 09:49:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 242ABC42705;
	Fri, 13 Mar 2026 09:49:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E700360027;
	Fri, 13 Mar 2026 09:49:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BF3D1036866F;
	Fri, 13 Mar 2026 10:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773395342; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yk6NdbxUor4kt40qhRmIWSO2SMCvSNIQULCSMqjltjs=;
	b=R88HP4h+kU7rRjA0nudrdR5fTxNY1Z8bX4lx9mHg0MflllLyCroqUjH2CIa6TU68r6s0wA
	o3c9ppf2dHwribzDS1xmIwpfdkL1P+UE/nH+DMzSYzyuxLYoJhmBZrPf1e8n1MdnlRqzf9
	VuLxQo2RN0mMn01vuL8FALW6cbWCNCYTivWus6A0dZXY6P5Krw7rCkUSWlFScZXWjOMVEf
	GpkBO2ZYzqLF8HZWH3C58iGwXV2otddGlECZMF8jZUxhMGD6kPPXX6jx1CjD1EVGNcv2ND
	Yw5V3FAjexPiIFd1QaxeqA463DD4EeSj/MXVM8s1Splu8HSyDo+ZFYe0oiyzkw==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20260312001534.24423-1-rosenp@gmail.com>
References: <20260312001534.24423-1-rosenp@gmail.com>
Subject: Re: [PATCH] i3c: master: use kzalloc_flex
Message-Id: <177339532351.2786768.2013268852251134908.b4-ty@bootlin.com>
Date: Fri, 13 Mar 2026 10:48:43 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=214;
 i=alexandre.belloni@bootlin.com; h=from:subject:message-id;
 bh=oBCQPKtK5Az13ehkpopwfmX73sgLMZ3HRch7z7IIzvA=;
 b=owEBbQKS/ZANAwAKAWOk3DBscDoyAcsmYgBps91+mWtJ5eosl0HSFlfJ6BDN9KkKk89Wvxe88
 i2qYer1ONeJAjMEAAEKAB0WIQQGqwVVleHyz/Q7kmJjpNwwbHA6MgUCabPdfgAKCRBjpNwwbHA6
 MiIfD/44ISwzRyyQkS9cZSeAiCKlhPjugS6w1FjCUyptLdTJ3pg9lSOyfTMcDrzjOJID/qJ6F3N
 iwEAHaw1aS9TS+7j1M3sr0H/MwhbNMruInUTOoKzU+sedAVe6JKoO15JqBzepNyVc5fAS6ZvVzB
 /+4A3gyi/u/nG/Oj8XrOvAC7PpWxkeEtmQrdwRP7Nc9P1No8Mh/ILDOl9C6EYwjBzpXhIGBB+x4
 7qFNc6/wdnpQ1ZZawEObQqCTHeVoQQjDhYW65KuCrJI7nYQmIJNBhHefDIl3EZPnicf9oYA/ZZP
 AedpmHDPgk70UZpoIKD7nhN3gdknumqA9UnuLpLpFHkXFyic3771VYCgy5B+l2uKH5kzkleDkMI
 dui1J0/jW2BVu/9CZdMzVlDXIt1f15bFA0yTFQHxSs1kJK78ouaKWMYz9JLHhHdqzfh5afhAjHn
 mVm1C/haNS2CH6AsSYjRCbvxfBnfdv4Hm7ord0ICLXBx4V4p3h9Jc1Y5sIk/Rka6gaCCQH28Myy
 MpuNOq73uUFvt0V5olojm4OEGAEhwSKB2fvyl5B5S+6cxBzspCVqigT5IcO3p1hSDu6E5W1OOL9
 UXazqmyX5jfWWCoblnZpFlfOIHEYljuu1AxzbfyEfQvnjW3PO9uMA5WpEGXQ0dWc1hOv2dzke/w
 Rh0w4yyVsg0f/0A==
X-Developer-Key: i=alexandre.belloni@bootlin.com; a=openpgp;
 fpr=D42657F65BEB9D45A004FCFAA6CD9F096F642CB3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_024907_109859_3DAC821A 
X-CRM114-Status: UNSURE (   2.76  )
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

On Wed, 11 Mar 2026 17:15:34 -0700, Rosen Penev wrote:
> i3c: master: use kzalloc_flex

Applied, thanks!

[1/1] i3c: master: use kzalloc_flex
      https://git.kernel.org/i3c/c/8ecd876fdaed

Best regards,


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
