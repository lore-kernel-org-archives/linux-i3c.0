Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1317C36017
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vo8JcozwRLrspP9KHMw8iv9BToFpUABKBtdWyN8jhCE=; b=3GP2/guiDX1h9s
	k/lzU/CjhvXPlP21glJckQHdH0F0/ygATiTC5cxLZ4nE+lbekR3bYsMRteDoyceuf/v++DHZf2vjs
	D2E2dPP8Tesc23n/x4VcZf/KEgYwt+nyb1zT1d92qrLVQiSYl8XIcVRYxSgj9GfFzCjn5t1Xq6ev0
	KRJOA0pvp9n1B5KN+NKjhvg6X8cEf/UWNxLP4AntSDSgAlZzZNEXqekCZyKW8w7ODpNcwLucXA7Jr
	p5tE9C7qRg7ptk2A3kyWWVEip/7i1IYBm2QCe76FI1bLBABc0owWv2Lys5gmFXIiWWPsrUqhlHPyy
	LzE1RzhXLhTEZ/qEE/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0E-0000000Hb2x-2WNA;
	Mon, 31 Mar 2025 10:04:22 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9lH-0000000DQBA-3wZl
	for linux-i3c@lists.infradead.org;
	Fri, 28 Mar 2025 13:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743168496; x=1743773296; i=markus.elfring@web.de;
	bh=IpfDNgazgXXBhb3QCNRjJJD4rFulvC5l9bpTYHKG/4I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V+ct6d2aiYPipLyNzTJIGp5xE3blwGV4MJzi71wDjLMjqIfaEpauAS4lUBBc5IKw
	 PesrvwSg3KCuHnHl8neZQscEK+QbLdvVIAUvuB5OZUf/URsJbSYX1TkJpUMe1FA99
	 0R6TwfI5+RTbgePAExWvKb0Re2vN8hGvn4fJ76nqPyJGRGVhU4aCwZ469b3bX5mrU
	 SkgVnvlZKcZVFVcl9DMGo99gU8qW6MVw3CccwZCHB3CxT+EhkvVhSngO8uVstH1qC
	 vEhRT7Zc9nYWmEGvlCqNwXaYlxyg+AB9AdIY0skgqo/g1GieSj9mdujNl/kM0mDWV
	 2/tQyNylINfPRKsyIg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MeDMb-1tNRlH03Md-00b2Hg; Fri, 28
 Mar 2025 14:28:16 +0100
Message-ID: <06545fa2-7f82-4154-a882-faddb53df4d9@web.de>
Date: Fri, 28 Mar 2025 14:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Subject: Re: [PATCH v2 2/3] i3c: master: Add Qualcomm I3C controller driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
X-Provags-ID: V03:K1:cT4tjGtvJXvSRL+OUV0lx2UA5LnpeNz7q6/InzNnyiHEeviRrrT
 J5NFpTF815mDYWMO4nPeGSD+QWvucLhYGTqXjab/uxjKLQs+S+00/gVECE65Ll0VkcaBJ13
 3O69z7LlI/4kiHqQB0J/15AuLEWqpqTotzAjYKo7DSXrGgpATtje3q3pelLnJc74ZIWTwWK
 5bbY3ik9lh+qlhh2hkwCA==
UI-OutboundReport: notjunk:1;M01:P0:VOlzgvrPiWw=;l+7eWe+iFzWKRZ3mRi7dimYU2oq
 grhkx9vsw/VEsjtCEXy54VQHpRClnNXV+HsR9CxvgANjp4EF3yKVRZOHULbMauoT8pJnnaooT
 26PitrDifSc990DwYDszXFag//F4MEJqvQFvQATnpP63nvBnufBWMaJ9lAfeD/W8HqNNa9QFp
 Wv4UUqLu5ospDIjmuWKH1ztIa6nRdFA4aSH77Cfrrea7EFQC4Yfhq99WXoI04ntItmb5LpWwr
 p3XiEo5ga1keYYYM5/g8ystw+oZWrIzac4taLPppQQSZMkXHg1i1a0I7+0ZLUpbrUgJcZLzXO
 5tR5w7hc6ierey3WTEXDSwEmn4G/LrevpBdHbCPbdq9ZF0BVnaHyjnK5HVXVdUcpW2xigWnaw
 /aWWZ3N9Q8lx1wUhvCcpdlULI+BdHafdtv5DttCKdGPvXn3bSGNpisCZk1eRvXCQTSo9AD3X3
 iJvTzfdgV3N7fU9fpJbvExMIQQKfMqApC+aXhE/u/hI8w9MBvl9UKh7zxk0rfN1mRKrGPD3Ay
 LBOpYj36D536AY0oUl/iVwgBiwI+uCMvO5/rRMbcTcRO6OwAPl0cit1RTyOQTnp7Zxcu38VHX
 9a2x3tvW6MnCiRVtLm63UNVzza4gPL7tLr1g/JNC1BPO+xNfEW7HV6JttUvUminTVKYw4WT6F
 kM+VnT++9dayUzuzO0zugVmwl02ktS7qWjNhFKFQwfHVh4Z1dDiCK40teZbGA57CREoYXPD0s
 PaswK4GWhPRj2JijkOdxI+cyIDafIfVblEzE2bJMQ4X78MOmp5yKFT/vl0AGp9Bts8kBZENLg
 sN38PcnpJXVZsAGGODKy+sKtRsCd6VPdO7L5GeKe6qUTwsaSNyTux6jZTZpMtxHSHPgwI0dJq
 1ucUB5aSYQ39vjc7k/LrH8GeHQMdeyoJjGsLFqxrEpAAV6mzM/S0asiXAVjsGdZ2P0zR1y2AZ
 PmYGR6kidtZy+1PlaFWBaG/XZLzz4XwvOqxJukKRxEscdnaRypUufwnfWXeJtOH8vn+t+99C/
 E4YuQq7a93OA3XFC6Sv5MRzbFjLN9jluFbuWR6iYF4bHvQiERfh80Tom2mhKwm9ED8NuBrxvu
 7oIPpZ7UgcGx8mwYDi6A39hw4JojweAt+HoBteW4kYoHRDIZvoMtzG/d7gMZbZo+f7Kq+BQCH
 wmSjV6WcqsG6r7vSt0ApWNjislltguxytljGvqGFIX7RBLDOk8D3Rg6SEtFkCrGf7NOJnhUPo
 d/kKoneAZ6TfdgqD7vZbRvfgdrWJcIo6AHRt7E5IM802j0a8Ndylp7MNeKh8ERifVzWx5GOTS
 tHV5e2/sh04YF//+YEfFTL/TvC8N51HOE4W+TAcQLQ3VeEMnI2OF2Y37YeqHmPWgFbMLnnti5
 toB+RCOs+2qe5s7SPYCbAuSfxuRtNcZZvsR7b9t5BY6kLbYjfTtw39fGX33e4aN9eB4L34HC/
 FIAzafpxCJg0qAp0Lsa25iy08tYcpQ0T3C0242WpeAmb4Aao4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_062840_289102_8BB7677F 
X-CRM114-Status: UNSURE (   4.47  )
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

4oCmCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3Fjb20taTNjLW1hc3Rlci5jCj4gQEAgLTAs
MCArMSwxMTA3IEBACuKApgo+ICsvKiBNX0NNRCBPUCBjb2RlcyBmb3IgSTJDL0kzQyAqLwo+ICsj
ZGVmaW5lIEkzQ19SRUFEX0lCSV9IVyAgICAgICAgICAwCj4gKyNkZWZpbmUgSTJDX1dSSVRFICAg
ICAgICAgICAgICAgIDEKPiArI2RlZmluZSBJMkNfUkVBRCAgICAgICAgICAgICAgICAgMgrigKYK
CkNhbiBhbiBlbnVtZXJhdGlvbiBiZWNvbWUgaGVscGZ1bCBoZXJlPwoKUmVnYXJkcywKTWFya3Vz
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
