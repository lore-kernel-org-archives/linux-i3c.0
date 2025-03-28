Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA71C36018
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmiS1VZog9hUvTN+u0RbO3ICxU/Svj2RUxodd1y6S00=; b=H8hZWdNAwZVvaE
	jIW4kAsyOMlmxlY+WFvngCxCyt8yTK3xuw46QMBUCYSHbs4Qu8sVVIEY2TS5AiSPnG+JeS4KiJ8D+
	YTFFtDcFnvQelRN7amKGGmMYmDN1Od7QmogffdYxJkRndTV8XUfnI7xMPbLO4evRXH3ELTtzlZ3eR
	E2q71Ojcp/pCf6usyzQoSFdtX63YSQ8rpqXRHjw/cUh1htI0gMoZEA3jn9oqIt4HDSjOxBP79Phon
	FufrYWbmgz7zt3Umvx6uTXvMNlOEJRjYnd8WdcpHT/ovS+HpFCFStxekJ3bp7oEsqdv6X8WtZJwvy
	ZH0hTvj6hTB+xUuBe3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0E-0000000Hb2d-1Lld;
	Mon, 31 Mar 2025 10:04:22 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9d4-0000000DPF0-2nht
	for linux-i3c@lists.infradead.org;
	Fri, 28 Mar 2025 13:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743167982; x=1743772782; i=markus.elfring@web.de;
	bh=DP88rPq/JYCBhLpHyj7Uu+ctiTC9ho6e5ZWTcc8Bw3Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QRVsdUjma2+1dnIp75j/U9u+t2iVo0DXPSWp4hxiuKRWlqk6Bpw7spBrkW3o2ncd
	 AgwMLcZyOFXh/yzMD3+GNnZyLvPvsq5kSWjWRj2+CFfhEcdfxMZMcYZm6kVyQOLiM
	 /dxj5Sq0L+8Xg/PfOeHzDI2EEsiGKCZVFl66Umj3FxCER8Qk6XayU+pm7+TIZdr9c
	 uORxocmB8fcKv6CZUwYb0Yicu/9DrrbldvtrjtLJfcVoOiCof6Kml4UKuNk0kYw5E
	 TX49xQZxnNo/FGxAMqtYZQOHGMByyzel3uF3wU01Zkd2BD1abfvkEUb2JYN9pVEuD
	 RVkrdoRamHhc9JULHA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2ggX-1tyzdB3EC7-003uVq; Fri, 28
 Mar 2025 14:19:42 +0100
Message-ID: <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
Date: Fri, 28 Mar 2025 14:19:39 +0100
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
X-Provags-ID: V03:K1:D1NZ9DZicC+HG+7dw0RV49Ulr4osReyhCq4fkq4n5AWuD2f3hEf
 O8AW59tx/bkU6DXG855XMR/FShgvgFnQgTfzSIt4PTvv/HfxCzZnwgjmdeYDQqOnZU621FC
 5/5aEmCtC9aexJcQqoQEB6SkHr6pST6dVCrjEj4VfXis/YBZtT7FlcZaTOkyDrWql6gJDmB
 plqdGAcGlgAPC5yWyC6kA==
UI-OutboundReport: notjunk:1;M01:P0:UUnc3BLpdwc=;2HmWBbEzTvCxzVkzd7w3vzCQtA2
 dGrGy5TnXmVcsyDq8Jm/zF3NKOHdVDLVmL8/1H+iuVUTCUuP53GvR4C1dLOcO9NXIkzSxVFoK
 sd9JfKlHFOLAAbHG8XgTHB/nfqer+TNUucb8xJoGwQzdCAHaH6i/Ps5jke3bXjPRzyN0pL/3e
 jJCaBMZbTEsmXPYpOJMcUXRSOTr7x3Hy9ct3qd8IKQZePIkufLuirQZiXpF6GRjeZ9mMMYIub
 RtebDjtQjZCt686TC4Ih1xJpm4oCKVmGwVdl9GpTTyUmu2hv0FBY8xCBQ0STTbDpMCKx70x1b
 b2I8iqmpeDRVSRNbodKFxb41DwU5VY2fQPfzGDODHo1wfG8GRNYwhHvYSx8IWYD7aaG4gwe7V
 3iHrhGg7nyNt53m6DRHTL2gMznhlIpvpcblEpshAp44UhSmxYO+ekOhNUyhscmgryK8+jczSE
 UcjhW4RWEV8z6KzCcrSPrt4URfjHwW3gdeyUQfpkRa5l50drQXDJaJN44JwharRQ7X8uMDEA3
 ARnp2eekcSvTe5gHMOypqyxG3d5UGimLhR1nM3JwMu6WPhBbqV/nBv2PLwZkJ2h2oofjyzP76
 Uro+2uRalPVRQaFgBKHlLWUllZznrrgPueEbGc+ZNZ+31ZwfOeLyJMnZyUF7qFWXe8R2GJ8uX
 tszXRUo7oC6NnjozCOFmk3l04BO7PyF6TtG8ipH/6LseqOdyScvHsWXlHKPJWrU/nWfSTJpbk
 E76XFXlWwv6tyTSZpgs76q9WzZStFJTQFB73UyRkARyAtN4cEVvwSsJ+2jxH5ABeyMuxAzJzD
 sZULWr5xBd+/a0L4nPCKUx3hM7QyTvk1UMwA3djDumxx/J7spzVuQJwBXBFfegmAAjdxtQcaG
 09LwVfppReIGVpCdAwGfwlVvJSG4DNC97zJALoytIXJcbjq3GFVfjLUH9dsJ4O3Tj9SY/f2d9
 blDt2GCiBLuYj1jBvWkgeqdRYFgtv8HEy9AdNAUW+OdIT2XegWe9CTQVVdi9FHvL5RYSZ80jr
 kVFG7Jv6pW3Pjqzipc//luk9j357oV17xeXCQaixF3+xCIr8BD3JxfTf2OuWEneXyZwuRVvdD
 9ruJx1Jp9PnEXXg+i+WzNhnFVSo5pNNvTEMCwit50yk4iBH140gAcGklqEdfBELAb/IMMGABb
 3+k6yLAqBkYl0QuGhqM//GJIReW2jR4+8RdqSUo3Co67XTaQD7xZ9rh82m2jV9qUXTPW2ve2N
 SNE+3NMFpm5hlkqUS3SKcrvUXC6ECSbFG2RNuhGFHRk3grAunB259ifLPqbZHBMBgg9X2pe4h
 L5DV46toqXxDodtEktSyZWMYTOHi3vMYJKAmiofLJAaPqt6jedWdv9jPrk8Aa135+Ltc5FgL8
 jiy30UquXyU2Q85K54o1iDAPphuR0lVsi1awwvMBAp2lpsjxgRGFpNtx+Z8R21veJvIyCmXBX
 qoDoM7YhGhRecODVykv4nWrYLRwZEN9bk85A751DMGWDfd636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_062011_016283_EBC2FE71 
X-CRM114-Status: UNSURE (   4.22  )
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
MCArMSwxMTA3IEBACuKApgo+ICtzdGF0aWMgdm9pZCBnZW5pX2kzY19hYm9ydF94ZmVyKHN0cnVj
dCBnZW5pX2kzY19kZXYgKmdpM2MpCj4gK3sK4oCmCj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmZ2kz
Yy0+aXJxX2xvY2ssIGZsYWdzKTsKPiArCWdlbmlfaTNjX2hhbmRsZV9lcnIoZ2kzYywgR0VOSV9U
SU1FT1VUKTsKPiArCWdlbmlfc2VfYWJvcnRfbV9jbWQoJmdpM2MtPnNlKTsKPiArCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJmdpM2MtPmlycV9sb2NrLCBmbGFncyk7CuKApgoKVW5kZXIgd2hpY2gg
Y2lyY3Vtc3RhbmNlcyB3b3VsZCB5b3UgYmVjb21lIGludGVyZXN0ZWQgdG8gYXBwbHkgYSBzdGF0
ZW1lbnQKbGlrZSDigJxndWFyZChzcGlubG9ja19pcnFzYXZlKSgmZ2kzYy0+aXJxX2xvY2spO+KA
nT8KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTQtcmM2L3NvdXJjZS9pbmNs
dWRlL2xpbnV4L3NwaW5sb2NrLmgjTDU3MgoKUmVnYXJkcywKTWFya3VzCgotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
