Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41476CAC59F
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVTPFnzI7c0cKOwKWRFcouCUF4WXSSLf9TF+vSlNnPk=; b=wmlpGduzsYx+wi
	IbZ0rCllpeFS9maXhxBG+OpY+O2yZ2m8Hc+P9E+CXkF1UYXnbN5cB+UHiP3pgbu6ke+Si86jodXCT
	VAkITVBcsN7uc4QXuI15qTU4IzxlgIwB8uw47wf6Sx7Jw5TM3ZuXjCMFZMdyR2THRC7XjPGz0WQjq
	A2kykUuj9CJkzxJmQKucFxb7PgGx9lkbBCQnb73uyuKy9pHD6Al1WQYdCY9gR+9f/X+mQUIQQP1P5
	Lm/DFcpotPTD/QTm9hNWlwsReqQB96Hr5F1tm7bpvVCAKNMwGv39g+E9fFl1PYNrMH3Qn19N+wdln
	UgewW9auil1m7juYxFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPg-000000029sB-3wlH;
	Sun, 14 Sep 2025 20:33:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuDLp-0000000D8Tl-24nY
	for linux-i3c@lists.infradead.org;
	Thu, 04 Sep 2025 17:02:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so7721255e9.0
        for <linux-i3c@lists.infradead.org>; Thu, 04 Sep 2025 10:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757005340; x=1757610140; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWUAfaIAwE02j83CxoHHqLBOvWVQ0yY4hz4cGgpAgVw=;
        b=iJp1gA0SIUxE3iluGKQkOYBzMibObJev+9tq29RRA9qhzSuD1x65hS77tEGTj92sX9
         lv7jZfghOVSnnSMxGNDw+TaaxhjRi/BrA6M7CUqLjdTCiksXsr6tRRSxG1X05wz5gqBF
         IJ+2zNS4FOIfXEjzKwavfOLBKvgbW/pmnVbtLc019/IyQE6L0otrafmksn5iIVdA6krZ
         aMUZyNY4RS+2x4mJD0W89x/aKihx4f4Q6OAe/MuJZpAcb0EoFlHyImAIWMMAyxaiG6AK
         +/ObtVPpXVSJjFcn30klDyOVVFRoHcpyAfosJHWiGQ9+qiP4Sz/OY9fnhberNWX8hF2H
         xbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757005340; x=1757610140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWUAfaIAwE02j83CxoHHqLBOvWVQ0yY4hz4cGgpAgVw=;
        b=xQJ9632sit5X7S7vxUs8ZBMl+xU1BlvvSzL6nTQHr5/R2aW0LtKIF14m+mlYNliBKj
         4suR0ID3dCLEVBMwjln+kz9w9WN86WAtpObg0SISAgDVoXZcg/Gai5fRzr/3Z8rwrkEH
         JNPwJjuWIQjWU4YNJ1paJLk2jEWuZlA3cTl4m8eaZfz8znClWLzPEEclCB01M6fy7vtk
         DYJjxxLvgSK1JkMTtiUoEGJ+M1NMU1ypsQ5hrBI+jRsZex6p9rrPiWeceordW2Tj0v+F
         QQYOLikOban7thmZ+ZeObKetyrsnop0LKJhJ8fINYtapNm3wbVWE6xPr+ggrH7Zhyazn
         TXQA==
X-Forwarded-Encrypted: i=1; AJvYcCVa53QJgtyX3GwXZ05kAGXdOwbweN2IpwE56vhAOtQUZNjtNLQfiCZmL1h6aXyQLtcwvCuXkTSOdzk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy24ibuuyaDew/Jju+7Cw1w2VPj6pPxgFVuAaCRIkmq9IBvg4pN
	P1Ln/IMjVJXj2ndAv4OvPrdAR4NaUibNTu6YrVDKBKShd/fEXd+a6V0ZfAa1diqPzh0wnnchPv9
	6SDOxg4GjL9RuVBaVR9nvsOoRQAlK5OE=
X-Gm-Gg: ASbGncvhvsJ1MGBDZnWmmlDVMIwju1+FyjeJ3XPmK7wWs4PZ9BPfiAhbSuvQzFTCeqj
	zlLh/wHg2ENMSP5vHq/5E+LReXp7dkbTXkS/5CbvvCoqXMW8VhlCUVba2zR8kStOHmgVfGl1zT8
	CrmDC0Di4trnVEpX4sCMaDhpbzzWm9a2Mxf+sPY4xbtqX+X/pvOtgcb1bkl/oEr92M5f/CU5kEC
	U3UCeT0JMBZ5qoMTkWusEuZPgAwQZnmueWgAn4VFBFWK1hF/7Y=
X-Google-Smtp-Source: AGHT+IGGWSzsCgErsrGr8zjXQxnW7N11Z1K/YsLBq7BIXz9uzKohNBsjiRHo+et+EPwzJ8Pg+931qO/wQAziXr+D7/w=
X-Received: by 2002:a05:6000:3107:b0:3de:e787:5d7b with SMTP id
 ffacd0b85a97d-3dee787626fmr6296285f8f.46.1757005339757; Thu, 04 Sep 2025
 10:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <aLm5kbgRIcomBo6a@ninjato>
In-Reply-To: <aLm5kbgRIcomBo6a@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Sep 2025 18:01:53 +0100
X-Gm-Features: Ac12FXxTKxEN51lya8eiqIz8Bn1e7rM0j_VjpYYSnIrgeF09dJthnrp4kknf5ok
Message-ID: <CA+V-a8t9VU4+Q6ofTYru2=OsrsfiSM53=rtvEzxoYmu_A0wwBg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_100221_535377_A23FEFD1 
X-CRM114-Status: GOOD (  14.26  )
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:23 -0700
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

SGkgV29sZnJhbSwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIFRodSwgU2VwIDQsIDIw
MjUgYXQgNTowOOKAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmlu
Zy5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5nIHN1cHBv
cnQgZm9yIHRoZSBJM0MgQnVzIEludGVyZmFjZSBvbiBSZW5lc2FzCj4gPiBSWi9WMkgoUCkgYW5k
IFJaL1YyTiBTb0NzLiBUaGUgSTNDIElQIG9uIHRoZXNlIFNvQ3MgaXMgaWRlbnRpY2FsIHRvCj4g
PiB0aGF0IGZvdW5kIG9uIHRoZSBSWi9HM0UgU29DLgo+Cj4gQ29vbCwgaGFzIGl0IGJlZW4gdGVz
dGVkIHdpdGggZGV2aWNlcyBhbHJlYWR5Pwo+ClllcyB3aXRoIHRoZSBQM1QxMDg1VUsgQXJkdWlu
byBTaGllbGQgRXZhbHVhdGlvbiBraXQgKGxvZ3MgY2FuIGJlIGZvdW5kIGF0IFswXSkuCgpbMF0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwOTA0MTY1OTA5LjI4MTEzMS0xLXByYWJo
YWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbS8KCj4gPiAtdGl0bGU6IFJlbmVzYXMg
UlovRzNTIGFuZCBSWi9HM0UgSTNDIEJ1cyBJbnRlcmZhY2UKPiA+ICt0aXRsZTogUmVuZXNhcyBS
Wi9HM1MsIFJaL0czRSwgUlovVjJIKFApIGFuZCBSWi9WMk4gSTNDIEJ1cyBJbnRlcmZhY2UKPgo+
IEkgc3VnZ2VzdCAiUmVuZXNhcyBJM0MgQnVzIEludGVyZmFjZSIuIFRoZSBhYm92ZSBpcyBub3Qg
Z29pbmcgdG8gc2NhbGUuCj4KT0ssIEknbGwgdXBkYXRlIGFuZCByZS1zcGluIHRoZSBwYXRjaC4K
Cj4gUmVzdCBsb29rcyBnb29kIGZyb20gYSBnbGltcHNlIQo+CgpDaGVlcnMsClByYWJoYWthcgoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
