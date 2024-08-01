Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C6FC52D71
	for <linux-i3c@archiver.kernel.org>; Sun,  4 Aug 2024 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTUDKzZVQR2M0BuuYIZLfjwrJ/1aWZViVYCXQXkK39Y=; b=21r4oyQkGoUCpV
	MnFWcmzKitk6km4A1/fFExfP+MTBY8Q+qd7ANDQwYSyqsg46+X62GKFD9OAOxNfTwtZV+j0vvpE5L
	+NxgfvP7C6+0PJNTzagtXBj4EvkgTNR4tlM6nd46T6rT5FMFjwxc9Ub4R9H1mPgJRMVTX2sUe41N9
	ICY0wCKqz/HhAJVDCvExmiYK6bC1Fgvkg2lw0gOcF3tPBb/SH2/UsNr0J/JOHfhCUe4NbtIGpGQKb
	gEXQ5w9N6C0iJvy/eSmu/tpsNhkeYpVNuE6zmQZeDMpOwgb5h9KbH1J53anGBwg9Ua86Jnj3IFpcK
	bvDjmWHO0H1ieYTr7ihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saiQT-0000000DvXj-0Mrm;
	Sun, 04 Aug 2024 21:06:01 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZRPK-00000004P4l-080e
	for linux-i3c@lists.infradead.org;
	Thu, 01 Aug 2024 08:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722501802; x=1723106602; i=markus.elfring@web.de;
	bh=CQp3GKwVPbSykTP1zO1E1wRNFejm6ihvP+iQi9limaM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=J7fKc0c165phl0NfgymzO04iOO+zavIWFdmwr7oNBRip71JHICSurGLINPl7a0lg
	 FedQAG+MJ7PIfzPB1265zKsKQasIZAxrosDl5f3H3WDwyWIrpVscmyrTJlhJSjMWM
	 VdJVwbA8T3lB9IrPgjALLSGD3jiZOumZVR/Fux8DIk1s+tJIt/Xm3rsAEHTeMkG8k
	 tjp7rKiAT8hfjscp1eZaFoSyMSqwTbMKrOzbvquSFsPp4Wri5IyWeRJGi6uhC0wJr
	 /LGg28O8HRqkW6bZG+XZFvR2JrBC9Fr+3BcdiV6ozg2rLQYrPqR4+7a0hwuIOprhH
	 mp2JVvA9Fl40tJqm0Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLARS-1sqQ3c0u9q-00OTWR; Thu, 01
 Aug 2024 10:43:22 +0200
Message-ID: <73180782-0f78-4e49-9528-172c5d8c43f6@web.de>
Date: Thu, 1 Aug 2024 10:42:56 +0200
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
X-Provags-ID: V03:K1:YbpryX/+DRSBcSU8+6mi9njm2dNI/wHtDq3ZO/tUM/dvgTqvWv7
 PRIO2b/RloTIK74+SjBlfZz4U3GEwueyDeLwrICYZNSCc42UmxVmQd0xQPk3IYR8VNpe0Cr
 iHVEm36QTzZBriqrHSbT9p/1a1egGIgCzVJ+HQt3VdO3qt2C3MqyEcmgKi59AEfXZ+UJrGt
 ql6EWwXjyQ62IVoZwMjmA==
UI-OutboundReport: notjunk:1;M01:P0:/Sr9o8//E8w=;uGeDbtd1xbAFlu9rnBCLtRel+wp
 XL5r4wiHiSVelWPKHGWGTjOMlNaH9VRKaSpF7BAaewRf0W2x82TiB05V5y5QPe5eLpNKVNjDZ
 DveFTS13C4xsmO6WoNipCzuGVTdrrjN+oiXV4v5KSJs17XAWLmxl0/Mk53TLAEfrp1+hYqaxE
 4Y5Jy3m6khdiCGlFte1a9xJpWullQZHqXq4LfuKZ2MJwji3TySCXc9uL/Zixd1QUjpggCBtp8
 NRp68MpYSY1b7ClJNeNQAfSWvYyrX17VUDQP1u1jsiWKtaQQN4T0ErSf/2J2PFqtz3F7c16nP
 pVx11+VlGJ22K0hxWELmsS5QwEISdpI2+RS+MT98GQr+m2UQIrrT8rL+1vZaKTXq403J1RNt5
 h3XHd5RvGYOYzJ3zrlWikQg+ddC/SzgIoVUsC8Z77180TOGfXU3YcwlzH5/6cJn//toyC9rLe
 1GWdsuQgftw982zlbCm7qEoC5tAT1m0hkU5YBtEVLyetzTbHNMHoHSTIVS5LobjoIwYrFog6G
 ryTa8GTHC3rhm6UXDfdkVrNRSN1U1EPdCreP3xfqdxHKe8ORhhiWGKe+5s4J+Vqqbkas43rH7
 a7hbP3olzKGLO3FlF8ffbClo9Noe9D3nm3T1X7Y7v9GWQLur6ZKOpK3ZtyyQvMi7Uh10fJCam
 M06R0f+b/jR/joq7PC+GArLtYCdfSgE1dRUL+uC9QQKATcPGriFINf47qraE/srrfL61hYm5y
 VE/Roo0SdTGPy9dvvWt+cxwPvlcKzlITZhxxUpCiSxnFvXdak/q5BhsW09LeB8p9k8TxvMROH
 8BSMcvIKpTBBDpY7WBt5OjWg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_014334_593423_1D30FE8E 
X-CRM114-Status: UNSURE (   4.72  )
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
LTAsMCArMSwyMzY0IEBACuKApgo+ICtzdGF0aWMgaW50IG5wY21faTNjX21hc3Rlcl9kb19kYWEo
c3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSkKPiArewrigKYKPiArCWludCByZXQsIGk7
Cj4gKwo+ICsJbXV0ZXhfbG9jaygmbWFzdGVyLT5sb2NrKTsKPiArCXNwaW5fbG9ja19pcnFzYXZl
KCZtYXN0ZXItPnJlcV9sb2NrLCBmbGFncyk7CuKApgo+ICsJbnBjbV9pM2NfbWFzdGVyX3NldF9z
ZGFfc2tldyhtYXN0ZXIsIDApOwo+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbWFzdGVyLT5y
ZXFfbG9jaywgZmxhZ3MpOwo+ICsJbXV0ZXhfdW5sb2NrKCZtYXN0ZXItPmxvY2spOwrigKYKClVu
ZGVyIHdoaWNoIGNpcmN1bXN0YW5jZXMgd291bGQgeW91IGJlY29tZSBpbnRlcmVzdGVkIHRvIGFw
cGx5IHN0YXRlbWVudHMKbGlrZSB0aGUgZm9sbG93aW5nPwoKKiBndWFyZChtdXRleCkoJm1hc3Rl
ci0+bG9jayk7CiAgaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTEtcmMxL3Nv
dXJjZS9pbmNsdWRlL2xpbnV4L211dGV4LmgjTDE5NgoKKiBndWFyZChzcGlubG9ja19pcnFzYXZl
KSgmbWFzdGVyLT5yZXFfbG9jayk7CiAgaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djYuMTEtcmMxL3NvdXJjZS9pbmNsdWRlL2xpbnV4L3NwaW5sb2NrLmgjTDU3MgoKUmVnYXJkcywK
TWFya3VzCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWkzYwo=
