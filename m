Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41905CF65D3
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VY4Sa+cAml7/FwHOFqyEr5hp803DpL4k04aG3a8Z56Q=; b=z1TNyyl9V2K4cD
	WdtY0DtAeyfiIyr+dodKcjut2JI20YEZjsHHMRRWZhOkGNqcerZO4kiJ9wwKaNgPBqV5+T3PzEy4l
	PWOUSt5in2nD5KRS8q2VnlXLe+Qbbrdgd76gn7XG5QZ8ocP5tTzZ87EWzDjioRmogGnugwrwlLQZ8
	DN8fmi9iU8e5kozCy5zaoJdvvZ/zpU8zURz8thuQ3d7+PIV8RX6bHMP3E3XpkxP7oWYnBuGmICHKI
	sjs7SZRLy/CCx6y6P+TLPYmfqcVowlbwHPorpRYXDb5UdXsC5n2cKK0k+T/Jf7B+WPw8bk5iLC1KK
	epJEUUw1UNfw8nVPKN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJk7-0000000CGuj-04fq;
	Mon, 26 Jan 2026 10:22:47 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJk4-0000000CGto-1JZu
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 10:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769422951; x=1770027751; i=markus.elfring@web.de;
	bh=qsf3jrROjHEL56k0rZ6/+4rK6pEMOGsggDwiZH2XhiE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M6ukZKmSA+hT8GpR5ZdeUoqHkVf5F+GdsH3ocuJFGksXDaxiY0tzpK+3dawE3UZP
	 BWNrEbLsGFXAyZQkBkocfDDp+M+zqwgKgPcHxnjtrVHPBE1tFzl2TZHe2I0iuDeI1
	 ztzS21yRrUgg1GYGDrscYbJLpf0jQq1QFVHis5eKhpGSEuojLtKRY0tevOV6OImUa
	 j6bSVFKsjj+CaqCHjd6JoZ14KJIVQv6HDDfnOWsSgNBDf0VhzcYYxhZi0im5XXEWi
	 HWGuoYo30ibTmsGUELEIQCSzES4erpz285Q7fbOrcH6Ixzcp6xd0UHqK6Rco4wm1j
	 40YT+TZAnF6oeTYcPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.253]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7usw-1vfO3o3IrC-0050F2; Mon, 26
 Jan 2026 11:22:30 +0100
Message-ID: <e1a21e4c-eb83-41bc-9b55-5332dff207a1@web.de>
Date: Mon, 26 Jan 2026 11:22:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zilin Guan <zilin@seu.edu.cn>, linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Aniket <aniketmaurya@google.com>,
 Frank Li <Frank.Li@nxp.com>, Jianhao Xu <jianhao.xu@seu.edu.cn>
References: <20260126081121.644099-1-zilin@seu.edu.cn>
Subject: Re: [PATCH] i3c: dw: Fix memory leak in dw_i3c_master_i2c_xfers()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260126081121.644099-1-zilin@seu.edu.cn>
X-Provags-ID: V03:K1:xdcSiemjAKPtRg3emO8bwvZCcttU0sEp4PZpPANnCXNGu+OozDG
 xy+9eQ9kumcnsA9VHGLhvfAXZKE2+sU2vLF6qGONpDhvW1WmyXrXp7I+ANCU+T1jsezWTG9
 VqOcTVGmql01c3L2eCnLY6/4MErJQoZ5fSRm1zikvA2HmFSdyFGD5uWwxPCTfQlq+dzGcxf
 I4RyVZkDd2evAQ83F2LbQ==
UI-OutboundReport: notjunk:1;M01:P0:1wNFhS3hnbc=;vGoTfHn32T5p5isIV8YGCTGvcwY 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 WyAgnlkXURp6Fe/7g/bSPPbOlVJv1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_022244_725985_C38E88A2 
X-CRM114-Status: UNSURE (   4.33  )
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

4oCmCj4gQWRkIGEgZHdfaTNjX21hc3Rlcl9mcmVlX3hmZXIoKSBjYWxsIHRvIHRoZSBlcnJvciBw
YXRoIHRvIGVuc3VyZSB0aGUKPiBhbGxvY2F0ZWQgbWVtb3J5IGlzIHByb3Blcmx5IGZyZWVkLgri
gKYKCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE5LXJjNS9zb3VyY2UvZHJp
dmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyNMMTA2NS1MMTEzNwoKKiBXb3VsZCB5b3Ug
bGlrZSB0byBjb21wbGV0ZSB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nIGJ5IHVzaW5nIGFub3RoZXIg
Z290byBjaGFpbj8KCiogSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBpbmNyZWFzZSB0aGUgYXBw
bGljYXRpb24gb2Ygc2NvcGUtYmFzZWQgcmVzb3VyY2UgbWFuYWdlbWVudD8KCgpTZWUgYWxzbyBv
bmNlIG1vcmU6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdGFibGUta2Vy
bmVsLXJ1bGVzLnJzdD9oPXY2LjE5LXJjNyNuMzQKClJlZ2FyZHMsCk1hcmt1cwoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
