Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299C8C197A0
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Nov 2023 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZA9eJ/xmUd31bufhMfZgdSBL6VmBdEaCSj4fUggdylI=; b=GAQx7nUehTeR3j
	r6IV4m+qdkZS5krT3s96w2pQ4zpbjlhj2m3J+u6ySCcQ0DTx8z/99ByiC68x9XiPdOLkJ0ZYf0jVj
	spZKhk4mo7DVTT2yyiDpJXNyy/TBYBVphE0FedcUTYMs/XHFQ8qdl86BJPo8A9kg5/BCYRkW/a4Lo
	x7PsYUjHqVLKAg/S/jo4MHfjNq9sgF8eZsVbUPPwvMNi4UJuUwFu2dI30bt2a6BRFBVOvZGu6I8Gx
	MplnCuBbDmZSzuw1jD+nfclljl6IXZBhftC6to/a4nMxZDx5BN3nLuNv6+IcEErmIVqjlmcbRzg19
	f43tnrdD2gD/+CAiDUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r40GY-006mIa-1G;
	Fri, 17 Nov 2023 14:56:18 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r40GV-006mHY-0Q
	for linux-i3c@lists.infradead.org;
	Fri, 17 Nov 2023 14:56:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0753540005;
	Fri, 17 Nov 2023 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700232969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pf0nYEwusCtMUvGA0AD+dqm1ydpMpawRzAwUrTE4UnU=;
	b=jp4MIHzRx//Nh2TRVBDuc0XEWS2UfzVp1geTqaljCUHSvBLM/f/TR3u9WW+ZGgetkdnjvM
	owkr0+EsmhY2Oj+JgGHN4CExr5z7Yrevbv0EntEESHOPNiqefK4Sb2WrQukLBccHlyQN79
	hOckF6YsrZe2L3f76UoW0jHDIzhWUcahVhL/ns/L8UJJblgoRfaeBgDuyV67f3YZlvcyu8
	2rSa5xouRZbUJedyCYXTdTlUXQpQKW1Mv5go7E1ry/4UIx673tpQ/ZBSOIK0FJm/DwCv+R
	cr/E6Dr20f6lMk6E/8BFrudlEXw88P+hgVSS4YCaDMjeyCdFLf/97Z72NC0DKA==
Date: Fri, 17 Nov 2023 15:56:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] i3c: master: Fix build error
Message-ID: <170023295614.386133.2514775199924063683.b4-ty@bootlin.com>
References: <20231117110924.634280-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231117110924.634280-1-jarkko.nikula@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_065615_309342_E525603A 
X-CRM114-Status: UNSURE (   5.55  )
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

Ck9uIEZyaSwgMTcgTm92IDIwMjMgMTM6MDk6MjQgKzAyMDAsIEphcmtrbyBOaWt1bGEgd3JvdGU6
Cj4gRml4IGJ1aWxkIGVycm9yIGNhdXNlZCBieSBjb21taXQgMmFhYzBiZjRlYmM4ICgiaTNjOiBB
ZGQgZmFsbGJhY2sgbWV0aG9kCj4gZm9yIEdFVE1YRFMgQ0NDIikgd2hpY2ggaW5jb3JyZWN0bHkg
YWNjZXNzIHRoZSAic3RydWN0IGkzY19jY2NfY21kX2Rlc3QKPiBkZXN0IiBhcyBwb2ludGVyLgo+
IAo+IGRyaXZlcnMvaTNjL21hc3Rlci5jOiBJbiBmdW5jdGlvbiDigJhpM2NfbWFzdGVyX2dldG14
ZHNfbG9ja2Vk4oCZOgo+IGRyaXZlcnMvaTNjL21hc3Rlci5jOjExNDA6MjE6IGVycm9yOiBpbnZh
bGlkIHR5cGUgYXJndW1lbnQgb2Yg4oCYLT7igJkgKGhhdmUg4oCYc3RydWN0IGkzY19jY2NfY21k
X2Rlc3TigJkpCj4gIDExNDAgfCAgICAgICAgICAgICAgICAgZGVzdC0+cGF5bG9hZC5sZW4gLT0g
MzsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgXn4KPiAKPiBbLi4uXQoKQXBwbGllZCwg
dGhhbmtzIQoKWzEvMV0gaTNjOiBtYXN0ZXI6IEZpeCBidWlsZCBlcnJvcgogICAgICBjb21taXQ6
IGI0ZGEzN2RiM2UyY2ZjMWM2MDg3NWIwYzEwY2ZjNTU2ZDUzNDJhM2EKCkJlc3QgcmVnYXJkcywK
Ci0tIApBbGV4YW5kcmUgQmVsbG9uaSwgY28tb3duZXIgYW5kIENPTywgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCi0tIAps
aW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
