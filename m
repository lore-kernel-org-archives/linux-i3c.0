Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7FEC36019
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6kZHiDEJOViWgoG0um20FE6WXI0ay+1wefIM+jn/I0=; b=oRRSZvthRMATqT
	kL76L/izIQAw2kY7qkHRjo2gHHAJv4LrQmXf22alHo05d0Yc4f/OFk+ILZXEWSSaLpGLbTpiCjcqP
	9e0aM9jirR4m7U6r/1HCRm6GMOZ1M1ygH+lWP56DF+MosWTrDFr7pIxkv6T+s/HZWut0IBrpM9lb9
	lrTdvWyID3Y9gcpTmnvFihaQysRmHIGQAtAUAJ/vz/0vUiG+jfhHIO/kr9751L3WdeNG0lZ2fEML1
	EbEcavIqLUWh1mL8eozQcefkykv55KW66aM5ccKXLM6piGAQep1bpBsuuvENQYRcoAiBGKUedHhh4
	s7uxNVfvsDviv42nNvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0E-0000000Hb3K-3s0U;
	Mon, 31 Mar 2025 10:04:22 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyF0m-0000000E9Mr-3zcC
	for linux-i3c@lists.infradead.org;
	Fri, 28 Mar 2025 19:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743188698; x=1743793498; i=markus.elfring@web.de;
	bh=jOsXkiN4zS8kiwV3cwiwixj57c5f74/Oq2sxAMpeJuM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=L0QLwyUyTR0EqrGx9YUwLuZmfmdlI8Hpb5sG96NM4+zNuDkJNA71s4EeyXxj0wuE
	 mqWz/z9oeFnd60z/beEb6si2p4BhTtPMaSGlCA4HzivGcGTPwKVxy/BX/lxygsBR9
	 nzJU6bdh4Puw4ZINNYs4APKD9s/fmzZ2oogYFOYB06DdMv8ldxaQIIc7CyCJp8dtp
	 nZoXcAVSbftqoFl6Ksh/QOAiHuNo4DYjizjJSZDnfOpHlUGQsp2okXITmVT02OW7P
	 r4SYk+E1l+AKUGdHZ0Gf1FoUI7mF8ogFxoaK7exgl58LC7bwbWSEwmhMVMvUewOTH
	 02SIyC8kyDSYEoCoPQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKdLK-1thgb02RWm-00LIxN; Fri, 28
 Mar 2025 20:04:58 +0100
Message-ID: <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
Date: Fri, 28 Mar 2025 20:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
X-Provags-ID: V03:K1:T7u3qxPI3WBz+9O34BuV/2Jv5KTEmCEu3iKfSY+G+o7DSm/aCvE
 pp9v/ic4W/McvGc0YbBtKGV0sx46UwVZOKFTGJtD5tIfv0ZPDXOgFDo7uiGWOhJM1h9BYYt
 rguY95Sbvn/Lp5K9m2BG0uWoqUoHvbAOK6G5a/IoY4JhBPofvSov9N/amDUniGxzNcFPEth
 nM/mqP4koheEiCN9ujjuA==
UI-OutboundReport: notjunk:1;M01:P0:qqse1amEUSE=;K+dmILupNtAQj8PPVB/oOTWLo6J
 NgMcVA52rk2boJxbQv2e7z86py5jTwh1bHYS4fNvLZ2iYoQtPzTaTQe9J0h4zE5j9DEB5T7Qi
 +6pppXVxwy5pL+s5rllEPHZ4faiyNOqBjUmUDY0nQxvdYI8cdonvWVj1VQDEdpRKMVWVU+PLj
 2yV79OgvPz6W9GOv8kA9rcym6K+ZPObg+ZtBN2jZIeCH6xpMii1t5Qb0vPX8/8DGNKM8PJ6OD
 0ARGOeA8x3HzLI2gCmG6XqNhILgpVmOmprROMevRHCqEq2TqlMW3afyF5fp+SI2AztUrMZMAF
 j9j4VgJDVVuHRpR+6WAdZRGlZYKgNsPF4cfd4YYU9IhYj6osUMr8iTv1klJGzxsajIQJkZqtj
 FDMBpWGIyFH786GSDaOf9BqLoNiWz8FVxGws/LgLh3m/fkgBhxGkdXqjX8gb8BGBGMqCgG8gd
 xCbjMdekPsthLdBZZP8PuBTBAvBEbzhkheUK83cV4PiT/iZQWIxEE1tk13mtsqa2hoHs20eFY
 JaiSXm85mpSMHNpbf+H8LKC7rku0PThBBEikRL9ioZ1722uXpsAXIlhxNdHIbNhHa5bJnjKfo
 90IOS3Gu9abBx926bEiT+BL6XgRr6VVAzQ082VpXvBFZTC+QCUyzPWGKoPVM033KSYCt+EAti
 /W0cPAxxBfR1RHQlMw+1qTN9NGBZW96iBpWC8HjR3t98U60IFxz55a6inQ79zKwXpVXuYMyJ1
 vzFQVCgwXCPLzJrrKKuZH2ANUDWD+qkuNiW22mdKNsBiUIp+ZLMR/xDwA4mU77SOmiy7cRNSQ
 4W8gtZywIgYXXoVK5UCvNVlYHrKX1eJqfGN9lSO17WgN/CQPZPAUqXtNerJg2gBOY8LhlsuPp
 I9udimlR/xi7GidGqEegpdvjxQYYJfMk4Rz07fMlDP1STL+K+VV6tybqrpOmJfhE82kRhx+Yv
 YVK17s2BUbRSaUObPANgSehzpR+Pa7cwAKMYCPcbgMAJcxhwi/dYp2DV/FYr+u/Gu8yu1uqXn
 5j8kd+/daaRFOovanpki+ON7XlMJLOT5ModkYAaWqN9AW+Sa55W0vBxUGocJRmAtnrt16SsHM
 /KX/spQGB3PU/rE6SSXICgxbzmGWxMP4z0QIovrw8e47jsascIVeH34Ouk+PrmpGSD1GH5nsm
 9229f8Kh+VacDqjINAyx68IWyXBvgeCpWUPCaL+zsyAFIsLKCA10jdBTw0ybo0OnTTkWgHe2B
 5RTWq4/Xs3xKi3OqoOuN47MxuzKqhTCA5FKWh5KluAaH46Jz13a1BJfkgRSGjdTLEnSnOd3AX
 mIDx7xO4snEzi5k0KI+hoeCarGCZ4GY6xkjoIUt5UKZCuacH2OqkVKXxrUjmT5mPIxVV4+JWo
 JYxO5cdMTgTufhjZrCEMlFtGeiz+605EOHWdBKrvT8HueRSXD4FOg94L5DoHmWtie9StJN9ze
 lnxz8GpFee7EtwUKM/M2YzplUkIJipmCGICx56NxAFQeiYF5d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_120501_369838_66B54543 
X-CRM114-Status: UNSURE (   2.42  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 31 Mar 2025 02:45:26 -0700
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

Pj4gVW5kZXIgd2hpY2ggY2lyY3Vtc3RhbmNlcyB3b3VsZCB5b3UgYmVjb21lIGludGVyZXN0ZWQg
dG8gYXBwbHkgYSBzdGF0ZW1lbnQKPj4gbGlrZSDigJxndWFyZChzcGlubG9ja19pcnFzYXZlKSgm
Z2kzYy0+aXJxX2xvY2spO+KAnT8KPiBEaWRuJ3QgZ2V0LCBoZW5jZSBhIHF1ZXN0aW9uLsKgIERv
IHlvdSBzdWdnZXN0IHRvIHVzZSBERUZJTkVfTE9DS19HVUFSRF8xIGluc3RlYWQgb2YgZXhpc3Rp
bmcgbWV0aG9kID8KSSBwcm9wb3NlIHRvIHBpY2sgZnVydGhlciBvcHBvcnR1bml0aWVzIHVwIGZv
ciBiZW5lZml0cyBmcm9tIHNjb3BlLWJhc2VkIHJlc291cmNlIG1hbmFnZW1lbnQuCgpSZWdhcmRz
LApNYXJrdXMKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
