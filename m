Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09D0C52D74
	for <linux-i3c@archiver.kernel.org>; Sun,  4 Aug 2024 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXqgD2R1bvdJD90OHj9BmHoMcZ22I4hxsfpHEjXGR5M=; b=oj1nWuRRxByTim
	VaCUpk7cOBtoJsEfw+lfr7UEgqqdGLgUFtetrwjwe+EUd8J6OTC4XHGf11ya1F2gQa9hp4vtF5gNr
	GEQ7SSqn5Zsn2mAz+KvVC0aZPABuLSZmFA2lYD/J8h+IGJj+xs6bKwFgKQA3YHBZDeBWoCZECl/uS
	AKhzwcbtEB2kDI2NbFAcKgfYKYLbH/FbkjS32Na+QdIC4cR2rp9zQ36EMrjm0WlZXMP1D0N0trO1S
	M7U/eaAzOYHQ7vnFiKamiUvX4ogTozwhAJrd1s3Xmh53+iktug1Z5e+xa8y8e4dGB2VVu/wQYGqg2
	NuIDlmMEiL/4Rqp9SR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saiQT-0000000DvYf-2WDn;
	Sun, 04 Aug 2024 21:06:01 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZRlW-00000004THO-0saD
	for linux-i3c@lists.infradead.org;
	Thu, 01 Aug 2024 09:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722503182; x=1723107982; i=markus.elfring@web.de;
	bh=H1qeNadCSH/lJd7w//ysMiO5jE1nOgWC2onDSyEJdJ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iZp9GoyWT3jJtox6YIvkeZ1DRU6J9TbSmM73lTebtLTdpBoMJrQo6V2xAkdkC0lp
	 jGjXkPqLBDN222/MnLyD2bxaZhs5ofwD5g70dUjGJ/dOOOIGp7pmZ/PGej/zF1sTF
	 TYd903/VjN5GYBjfNqK5kY0GlkLabuEFuVDEh8O1rDhOgIYjqEjfb6MU3kyqUqlzq
	 hXn1MuNx/4WUf2t6tsJzwULBgdT3Jv7kTT2OVKR5p6uJZ6/M3pOPm2xZTf9C/HwDv
	 2jWeSiskEU0YZN9mdaLBzxhDvsdwpUNWLydBcvkCxU00QRLEk4Ccy95ko6ruupGlH
	 a1Dan+w66fu+ehx1vA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzCEB-1sLTif1wax-00tFVo; Thu, 01
 Aug 2024 11:06:22 +0200
Message-ID: <910f96b4-509d-445e-8749-ee4240849b0b@web.de>
Date: Thu, 1 Aug 2024 11:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Chiang <cpchiang1@nuvoton.com>, Stanley Chu <yschu@nuvoton.com>,
 linux-i3c@lists.infradead.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Joseph Liu <kwliu@nuvoton.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
References: <20240801071946.43266-3-yschu@nuvoton.com>
Subject: Re: [PATCH 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240801071946.43266-3-yschu@nuvoton.com>
X-Provags-ID: V03:K1:cv1GejkDpGglUQJHRpjeZ/Lyh4VjytkKH29sJnL6xwtkrklUbmg
 rz34ZyrkbnO71Fl+Ryg6xj/j/CKo+YKc8nB9JsbQlBwP+xGN3Ni10jJHaORjHx9radPbJE3
 9yf1hqqs+QxzxvJV+I3HLqxY7RoFLDlYr8n4dF+JxhyiIIdxc5yYI2bAO3NeLFMMC3pjZYZ
 RDu5WYRToRIFl4QDeyIhw==
UI-OutboundReport: notjunk:1;M01:P0:XCX5bElp9yc=;llUWJOUHi/eBMuE2SjC8YPKvOAI
 WakZfsGMV5d/3NetHrU7cmtG0BIrzsJ7aOKs66jQTvfpZQXBv7CUlunPMSNRhGASBh0QqqQFj
 wr+wMubfeRkfhr8WwxGf63huYT70qJsY3q3Tm9elbu35fYBheSu8mE9FJUn103vBdJsD3zCLc
 /TKh5YkYhUtKl0eHhhtDcweQNdf+qMCoQ466OX6WFDhm537HODpgEYX6jV8z7gbc2h1GJzgLz
 UTlF5B4B+Y4BYMkifZ86y709STwUAmxl+ueoIZsaSTa4q7ePeZMbAGJBa4VoZLF1wXFJwhO7n
 HgO8nLd8y6wQJ36b+6CGVxnag4MdN7VUhwAQD4JSHRlpzdkP78WQAFTazpIHa2JZxpJAy6mO1
 qXlax29sjw639DPdPbU8DjhtA8ZNu359/DMML8Rif90+19+LSAtkkg0spxynahhPDAKsojSAb
 KE0LDaGtCT3UuDxO/hG4dgm93m7bUfxPLtU1/wGMEGUMqqVFVuLt6hhjuYmHiscyu0JDLkq6S
 DWipx7R1fkmrNXQ6MW878YuFNOrGcW4CwD5Gjz/Nag5Vm0gyB/vBnca+50emg8ghxlMUVoKw8
 d6YzgP99C/2le87Upi2dfwll3itVTE/VL3Hcci007cz8aSu7KJWlnRaOgvxyCrClCv+EJy2Ff
 Zw5Jn/IsNks4Yq5+NlOuRcQ8VGLJCkOeXEwS0oWyc9k0KBH2fp+kLx5zibDbwfQRHloKBl26Y
 QvN4gX97lsNeDjI47iw61zcrfiU2hgshAJfqhON5m14GtYxboNQBURoCRzCWHPampdIz2qC/t
 mfuD94XnjXMy2pGDoTeWnrdQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_020630_607341_23B4F656 
X-CRM114-Status: UNSURE (   6.28  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 04 Aug 2024 14:05:58 -0700
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

4oCmCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL25wY204NDUtaTNjLW1hc3Rlci5jCj4gQEAg
LTAsMCArMSwyMzY0IEBACuKApgo+ICtzdGF0aWMgaW50IG5wY21faTNjX21hc3Rlcl9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7CuKApgo+ICsJcmV0dXJuIDA7Cj4gKwo+
ICsJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKG1hc3Rlci0+ZGVidWdmcyk7Cj4gKwo+ICtlcnJf
ZGlzYWJsZV9jbGtzOgrigKYKClBsZWFzZSBhdm9pZCBub24tcmVhY2hhYmxlIGNvZGUgaGVyZS4K
ClJlZ2FyZHMsCk1hcmt1cwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
