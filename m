Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16CCCDB46F
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jun 2026 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAm/879WrjWlf8T39phQFfQeGx8pDHg43KdaxVWwvr0=; b=x1qMhVBMcITDSn
	qysxWp6C0arDyzzYeps/JGLrORTZbcVdqp3kKOv4K4Lvxh1JcnvH++is9k966G7M+ZH4szcYhvhIf
	dCk091WQ/e2YhTSXpvSmvWK+7rVB2D0ZvB6KxDeMV+oeU2fSRXYrwoot6BaYbhEGlcu6edNSqCE38
	qUw3g7Z0DRBZkyN47Z/yG00Dy6EDn90my1MptYHdJsiBoDpwrLXSWdz9kHt0Ra2x3nN5ZQXMgl2L2
	QowAujs3+B6C1ttixx/MptG+jZ8TyJc1vmVZ54Uhq2fpDJ8IgQCMeOZhkxz7gAqExn3bikrSGspB3
	BcY7+JxFZfN3joYpSBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxFB-00000005zaG-37uJ;
	Tue, 23 Jun 2026 09:16:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxF7-00000005zUa-3HzV
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jun 2026 09:16:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA76A1A087C;
	Tue, 23 Jun 2026 09:16:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F664601C2;
	Tue, 23 Jun 2026 09:16:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B94E106C81A8;
	Tue, 23 Jun 2026 11:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782206184; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/fuHLfgTRA4ElpvtJMg1gvFvPPNyP7cJEy8DoAfVjf0=;
	b=l8cMU71qR7xp1LF+qQdE7TdQPwMbDW5Maxu/t8dQBV//ZxabDesByvm8melI6wrrzQBoB/
	gadZvGuKWK/Xd/VvdpGjesq1sQJ0oU7LyS55ijWzZghcqvAqZvpmyWacVN8VmGHtct4JZk
	Khs5kut4O4XxqNchwzzM49uxIb1bvHE+Jho5kFAHrupRFdlwJ8MhQfgV+Dtn9TC5w2NZ2s
	oqAv5EC36yd1daegn6DmEyoNwRWQr1oT9nkdHySAQxZX3w3/2mnupTMwRXF0UboMRC9ZA7
	bnxGZA7teTi0W3XF+ds6FW86toTOzaUQDSTnO+NKD51guuTSdUUXEkap03i1ag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Frank Li <Frank.Li@nxp.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  linux-i3c@lists.infradead.org,
  imx@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: report timeout waiting for STOP idle
In-Reply-To: <20260623060821.23238-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Tue, 23 Jun 2026 14:08:21 +0800")
References: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 23 Jun 2026 11:16:22 +0200
Message-ID: <87y0g5mxax.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_021629_976587_8E5DE319 
X-CRM114-Status: UNSURE (   6.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpPbiAyMy8wNi8yMDI2IGF0IDE0OjA4OjIxICswOCwgUGVuZ3BlbmcgSG91IDxwZW5n
cGVuZ0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IHN2Y19pM2NfbWFzdGVyX3hmZXIoKSBlbWl0cyBT
VE9QIG9yIGZvcmNlLWV4aXQgZm9yIHRoZSBmaW5hbCB0cmFuc2Zlcgo+IGFuZCB0aGVuIHdhaXRz
IGZvciB0aGUgY29udHJvbGxlciBzdGF0ZSB0byBiZWNvbWUgaWRsZSwgYnV0IGlnbm9yZXMKPiBy
ZWFkbF9wb2xsX3RpbWVvdXQoKS4gVGhlIGZ1bmN0aW9uIGNhbiB0aGVyZWZvcmUgcmV0dXJuIHN1
Y2Nlc3Mgd2hpbGUKPiB0aGUgY29udHJvbGxlciBpcyBzdGlsbCBub3QgaWRsZS4KPgo+IFJldHVy
biB0aGUgaWRsZS13YWl0IGVycm9yIHRocm91Z2ggdGhlIGV4aXN0aW5nIHdhcm5pbmcvRklGTyBj
bGVhbnVwCj4gcGF0aCBzbyB0aGUgY2FsbGVyIG9ic2VydmVzIHRoZSBmYWlsZWQgdHJhbnNmZXIg
d2l0aG91dCBlbWl0dGluZyBhCj4gc2Vjb25kIFNUT1AgYWZ0ZXIgdGhlIGZpbmFsIFNUT1Agb3Ig
Zm9yY2UtZXhpdCBoYXMgYWxyZWFkeSBiZWVuIHNlbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5n
cGVuZyBIb3UgPHBlbmdwZW5nQGlzY2FzLmFjLmNuPgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51
eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
